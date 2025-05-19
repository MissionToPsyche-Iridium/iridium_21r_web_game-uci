class_name GameScene extends Node2D

@export var defaultSpawnPoint: Vector2 = Vector2(0, 0)
@export var camera_bounds: CollisionShape2D = null
@export var background: Background = null

signal transition_scene(scene: String, spawnPosition: Vector2)

@export var transitions: Array[SceneTransition]
@export var scene_id: SceneId

enum SceneId {
	NONE,
	MAIN_BASE,
	MINING_AREA,
	LAB,
	ZIMBO,
	STATION,
	HOUSE1,
	HOUSE2,
	HOUSE3
}




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for transition in transitions:
		transition.transition_enter.connect(_on_transition_enter)
	#GameManager.instance.set_camera_bounds(camera_bounds)
	ObjectiveManager.instance.on_scene_load(scene_id)

func _on_transition_enter(scene: String, spawn_position: Vector2):
	transition_scene.emit(scene, spawn_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
