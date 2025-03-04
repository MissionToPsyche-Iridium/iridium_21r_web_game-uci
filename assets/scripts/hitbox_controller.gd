extends Node2D

@export var frame_paths: Array[String] = [
	"res://assets/prefabs/mining/mine_down.tscn",
	"res://assets/prefabs/mining/mine_left.tscn",
	"res://assets/prefabs/mining/mine_right.tscn",
	"res://assets/prefabs/mining/mine_up.tscn"]

var frames: Array[Resource] = []
var active_frame = null
var dmg_to_do: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	for frame_path in frame_paths:
		frames.append(load(frame_path))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_damage(dmg: int) -> void:
	dmg_to_do = dmg

func draw_hitbox(id: int) -> void:
	if active_frame:
		active_frame.queue_free()
		active_frame = null
	active_frame = frames[id].instantiate()
	active_frame.set_name("hitbox")
	active_frame.body_entered.connect(_on_hitbox_enter)
	add_child(active_frame)

func _on_hitbox_enter(body: Node2D) -> void:
	if body is Ore:
		body.on_hit(dmg_to_do)

func clear_hitbox() -> void:
	if active_frame:
		active_frame.body_entered.disconnect(_on_hitbox_enter)
		active_frame.queue_free()
		active_frame = null
