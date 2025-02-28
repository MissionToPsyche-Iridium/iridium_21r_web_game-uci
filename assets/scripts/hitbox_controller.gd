extends Node2D

@export var frame_paths: Array[String] = [
	"res://assets/prefabs/mining/mine_down.tscn",
	"res://assets/prefabs/mining/mine_left.tscn",
	"res://assets/prefabs/mining/mine_right.tscn",
	"res://assets/prefabs/mining/mine_up.tscn"]

var frames: Array[Resource] = []
var active_frame = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	for frame_path in frame_paths:
		frames.append(load(frame_path))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func draw_hitbox(id: int) -> void:
	if active_frame:
		active_frame.queue_free()
		active_frame = null
	active_frame = frames[id].instantiate()
	active_frame.set_name("hitbox")
	add_child(active_frame)

func clear_hitbox() -> void:
	if active_frame:
		active_frame.queue_free()
		active_frame = null
