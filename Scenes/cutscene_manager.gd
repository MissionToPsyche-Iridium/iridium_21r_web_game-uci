class_name CutsceneManager extends Node

static var instance: CutsceneManager = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (instance != null):
		instance.queue_free()
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
