class_name SceneTransition extends Area2D

signal transition_enter(scene: String, spawn_position: Vector2)

@export var scene: String = "res://scenes/demo.tscn"
@export var spawn_position: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_enter)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_enter(body: Node2D):
	print("body entered")
	transition_enter.emit(scene, spawn_position)
