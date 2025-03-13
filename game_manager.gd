class_name GameManager extends Node2D

@onready var Scene_transition_animation = $transition_animation/AnimationPlayer
@onready var resource_manager: ResourceManager = $ResourceManager
@onready var camera: PhantomCamera2D = $PhantomCamera2D
@export var startScene: String = "res://cutscenes.tscn"

const player = preload("res://assets/prefabs/player.tscn")

static var instance: GameManager = null
var scene: Resource
var scene_instance: Node = null
var player_instance: Player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self
	randomize()
	camera.follow_target = self
	Dialogic.signal_event.connect(_on_dialogic_signal)
	change_scene(startScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(path: String, spawnPosition: Vector2 = Vector2(0, 0), playerActionable: bool = true):
	if (scene_instance != null):
		scene_instance.queue_free()
	despawn_player()
	scene = load(path)
	scene_instance = scene.instantiate()
	await call_deferred("add_child", scene_instance)
	if scene_instance is GameScene:
		spawn_player(spawnPosition, playerActionable)
		scene_instance.transition_scene.connect(_on_scene_transition)
	if scene_instance is Control:
		pass

func set_camera_bounds(bounds: CollisionShape2D) -> void:
	camera.set_limit_target(bounds.get_path())

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
			_:
				printerr("Unknown signal %s" % args["type"])

func set_player_actionable(value: bool) -> void:
	if player_instance != null:
		player_instance.actionable = value

func _on_scene_transition_1_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#print("transition")
	if body is Player:
		#print("transition")
		Scene_transition_animation.play("fade_in")
		await get_tree().create_timer(.5).timeout
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://scenes/screen_2.tscn")
