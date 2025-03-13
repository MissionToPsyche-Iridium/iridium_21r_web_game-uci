extends Node2D

@onready var Scene_transition_animation = $scene_transition1/transition_animation/AnimationPlayer
@onready var resource_manager: ResourceManager = $ResourceManager
@onready var camera: PhantomCamera2D = $PhantomCamera2D
@export var startScene: String = "res://cutscenes.tscn"

const player = preload("res://assets/prefabs/player.tscn")

var scene: Resource
var scene_instance: Node2D = null
var player_instance: Player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	camera.follow_target = self
	Dialogic.signal_event.connect(_on_dialogic_signal)
	change_scene(startScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(path: String, spawnPosition: Vector2 = Vector2(0, 0)):
	if (scene_instance != null):
		scene_instance.queue_free()
	despawn_player()
	scene = load(path)
	scene_instance = scene.instantiate()
	add_child(scene_instance)
	if scene_instance is GameScene:
		print("game scene!")
		spawn_player(spawnPosition)
		scene_instance.transition_scene.connect(_on_scene_transition)

func spawn_player(position: Vector2) -> void:
	player_instance = player.instantiate()
	add_child(player_instance)
	player_instance.position = position
	camera.follow_target = player_instance

func despawn_player() -> void:
	if player_instance != null:
		player_instance.queue_free()
		player_instance = null
	camera.follow_target = self

func begin_transition(scene_path: String, spawnPosition: Vector2 = Vector2(0, 0)) -> void:
	change_scene(scene_path, spawnPosition)

func _on_scene_transition(scene_path: String, spawnPosition: Vector2) -> void:
	print("received trans signal")
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
				begin_transition(args["scene"], Vector2(x, y))
			"setPlayerActionable":
				if player_instance != null:
					player_instance.actionable = args["value"]
			_:
				printerr("Unknown signal %s" % args["type"])

func _on_scene_transition_1_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#print("transition")
	if body is Player:
		#print("transition")
		Scene_transition_animation.play("fade_in")
		await get_tree().create_timer(.5).timeout
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://scenes/screen_2.tscn")
