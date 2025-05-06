class_name CutsceneManager extends Node

static var instance: CutsceneManager = null

var has_mined: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (instance != null):
		instance.queue_free()
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_cutscene(cutscene_name: String) -> void:
	GameManager.instance.set_player_actionable(false)
	Dialogic.start(cutscene_name)

func start_cinematic_cutscene(cutscene_name: String) -> void:
	GameManager.instance.set_player_actionable(false)
	GameManager.instance.change_scene("res://scenes/cutscene.tscn")
	Dialogic.start(cutscene_name)
