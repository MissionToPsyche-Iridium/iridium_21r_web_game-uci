class_name CutsceneManager extends Node

static var instance: CutsceneManager = null

const CUTSCENE_SCENES: Dictionary = {
	"An_alien_greeting": "res://scenes/cutscene-An_alien_greeting.tscn"
}

var has_mined: bool = false
var cutscene: Cutscene = null

# scene change triggers; keys are scene paths, values are cutscenes to play if the scene should trigger a cutscene
var scene_change_triggers: Dictionary = {}

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
	print("starting cutscene %s" % cutscene_name)
	GameManager.instance.set_player_actionable(false)
	
	Dialogic.start(cutscene_name)

func play_animation(animation_name: String) -> void:
	if cutscene != null:
		cutscene.play_animation(animation_name)

func check_if_scene_change_triggers_cutscene(scene_path: String) -> String:
	if scene_path in scene_change_triggers:
		return scene_change_triggers[scene_path][0]
	return ""

func add_scene_change_trigger(scene_path: String, cutscene_name: String) -> void:
	print("adding %s: %s" % [scene_path, cutscene_name])
	if not scene_path in scene_change_triggers:
		scene_change_triggers[scene_path] = []
	scene_change_triggers[scene_path].append(cutscene_name)

func remove_scene_change_trigger(scene_path: String, cutscene_name: String) -> void:
	if not scene_path in scene_change_triggers:
		print("scene not found")
		return
	var cutscene_list: Array = scene_change_triggers[scene_path]
	var i: int = scene_change_triggers[scene_path].find(cutscene_name)
	print(i)
	if i != -1:
		print("popping %s" % cutscene_name)
		scene_change_triggers[scene_path].pop_at(i)
		if len(scene_change_triggers[scene_path]) < 1:
			print("erasing %s" % scene_path)
			scene_change_triggers.erase(scene_path)
