class_name GameManager extends Node2D
# The GameManager is a singleton class that manages the game state.
#	It's responsible for spawning the player, instantiating world scenes, transitioning between scenes,
#	and linking up all of the appropriate references when instantiating game objects.

@onready var Scene_transition_animation = $CanvasLayer/transition_animation/AnimationPlayer
@onready var canvasLayer: CanvasLayer = $CanvasLayer
@onready var resource_manager: ResourceManager = $ResourceManager
@onready var camera: PhantomCamera2D = $PhantomCamera2D
@export var startScenePath: String = "res://start_scene.tscn"
var startScene: StartScene = null

const player = preload("res://assets/prefabs/player.tscn")

static var instance: GameManager = null
var scene: Resource
var scene_instance: Node = null
var player_instance: Player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self
	randomize()
	camera.set_follow_target(self)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	change_scene(startScenePath)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func change_scene(path: String, spawnPosition: Vector2 = Vector2(0, 0), playerActionable: bool = true):
	if (scene_instance != null):
		scene_instance.queue_free()
	if camera.get_limit_target() as String != "":
		remove_camera_bounds()
	despawn_player()
	scene = load(path)
	scene_instance = scene.instantiate()
	add_child(scene_instance)
	if scene_instance is GameScene:
		spawn_player(spawnPosition, playerActionable)
		scene_instance.transition_scene.connect(_on_scene_transition)
		if scene_instance.background != null:
			scene_instance.background.camera = camera
		set_camera_bounds((scene_instance as GameScene).camera_bounds)
	if scene_instance is Control:
		pass
	if scene_instance is StartScene:
		startScene = scene_instance
	if scene_instance is Cutscene:
		camera.set_follow_target(scene_instance.camera_target)
		CutsceneManager.instance.cutscene = scene_instance as Cutscene



func set_camera_bounds(bounds: CollisionShape2D) -> void:
	camera.set_limit_target(bounds.get_path())

func remove_camera_bounds() -> void:
	camera.set_limit_target("")

func spawn_player(spawn_position: Vector2, actionable: bool = true) -> void:
	player_instance = player.instantiate()
	await call_deferred("add_child", player_instance)
	player_instance.position = spawn_position
	player_instance.actionable = actionable
	camera.set_follow_target(player_instance)

func despawn_player() -> void:
	if player_instance != null:
		player_instance.queue_free()
		player_instance = null
	camera.set_follow_target(self)

func begin_transition(scene_path: String, spawnPosition: Vector2 = Vector2(0, 0), playerActionable: bool = true) -> void:
	Scene_transition_animation.play("fade_in")
	await get_tree().create_timer(.5).timeout
	var cutscene_name: String = CutsceneManager.instance.check_if_scene_change_triggers_cutscene(scene_path)
	print("going to %s" % scene_path)
	if cutscene_name != "":
		print("triggering cutscene: %s" % cutscene_name)
		var cutscene_scene: String = "res://scenes/cutscene.tscn"
		if cutscene_name in CutsceneManager.CUTSCENE_SCENES:
			cutscene_scene = CutsceneManager.CUTSCENE_SCENES[cutscene_name]
		change_scene(cutscene_scene, Vector2.ZERO, false)
		CutsceneManager.instance.remove_scene_change_trigger(scene_path, cutscene_name)
		CutsceneManager.instance.start_cinematic_cutscene(cutscene_name)
		GameManager.instance.Scene_transition_animation.play("fade_out")
	else:
		change_scene(scene_path, spawnPosition, playerActionable)
		Scene_transition_animation.play("fade_out")

func _on_scene_transition(scene_path: String, spawnPosition: Vector2) -> void:
	begin_transition(scene_path, spawnPosition)

func _on_dialogic_signal(args: Dictionary):
	if ("type" in args):
		match args["type"]:
			"transition":
				var x: float = 0
				var y: float = 0
				if "xPos" in args:
					x = args["xPos"]
					y = args["yPos"]
				var playerActionable = true
				if "playerActionable" in args:
					playerActionable = args["playerActionable"]
				begin_transition(args["scene"], Vector2(x, y), playerActionable)
				if "cutsceneToPlay" in args:
					Dialogic.start(args["cutsceneToPlay"])
			"setPlayerActionable":
				set_player_actionable(args["value"])
			"startQuest":
				start_quest(args["questId"])
			"playIntro":
				if startScene != null:
					startScene.start_intro()
			"playCutsceneAnimation":
				if CutsceneManager.instance.cutscene != null:
					CutsceneManager.instance.play_animation(args["animationName"])
			"addItemToInventory":
				print(args["itemType"])
				ResourceManager.instance.add_to_inventory(args["itemType"], args["amount"])
			_:
				printerr("Unknown signal %s" % args["type"])

func start_quest(questId: int) -> void:
	ObjectiveManager.instance.set_quest(questId)

func set_player_actionable(value: bool) -> void:
	if player_instance != null:
		player_instance.actionable = value
		player_instance.set_state(Player.States.IDLE)

func _on_scene_transition_1_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#print("transition")
	if body is Player:
		#print("transition")
		Scene_transition_animation.play("fade_in")
		await get_tree().create_timer(.5).timeout
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://scenes/screen_2.tscn")
