class_name GameScene extends Node2D

@export var defaultSpawnPoint: Vector2 = Vector2(0, 0)

signal transition_scene(scene: String, spawnPosition: Vector2)

@export var transitions: Array[SceneTransition]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for transition in transitions:
		transition.transition_enter.connect(_on_transition_enter)
	pass # Replace with function body.

func _on_transition_enter(scene: String, spawn_position: Vector2):
	transition_scene.emit(scene, spawn_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
