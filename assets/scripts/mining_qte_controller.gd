extends Node2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var tick: Sprite2D = $Bar/Tick

# Width of the moving bar that goes left and right
@export var maxWidth: float = 900.0
@export var tickSpeed: float = 1.5

var _moving: bool = false
var _movingRight: bool = true
var _tickPosition: float = 0.0 # Ranges from 0 - 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationPlayer.play("inactive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _moving:
		if _movingRight:
			_tickPosition = min(1, _tickPosition + (tickSpeed * delta))
			if (_tickPosition >= 1):
				_movingRight = false # switch directions
		else:
			_tickPosition = max(0, _tickPosition - (tickSpeed * delta))
			if (_tickPosition <= 0):
				_movingRight = true
		tick.position.x = (_tickPosition * maxWidth) - (maxWidth / 2)

func start_qte() -> void:
	if !_moving:
		_moving = true
		_movingRight = true
		_tickPosition = 0
		animationPlayer.play("active")

# Returns a float between 0 and 1 representing how close to the center the bar landed
func swing_pickaxe() -> float:
	_moving = false
	animationPlayer.play("fade")
	return 1 - (abs(0.5 - _tickPosition) * 2)
