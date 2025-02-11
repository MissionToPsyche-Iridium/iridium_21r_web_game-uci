extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("opening_cutscene")
	Dialogic.end_timeline()
	Dialogic.start("arrival_at_psyche")
	Dialogic.end_timeline()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
