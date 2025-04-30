class_name Background extends Sprite2D

@export var offsetMultiplierX: float = 0.75
@export var offsetMultiplierY: float = 0.1
var camera: Node2D
var initialX: float = position.x
var initialY: float = position.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera:
		position.x = offsetMultiplierX * camera.position.x + initialX
		position.y = offsetMultiplierY * camera.position.y + initialY
