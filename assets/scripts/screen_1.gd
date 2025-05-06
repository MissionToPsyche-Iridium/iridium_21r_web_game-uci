extends Node2D

#@export var connected_scene = "screen_2" # name of screen to change to
#var scene_to_switch_to = "res://scenes/screen_2.tscn"
@onready var Scene_transition_animation = $scene_transition1/transition_animation/AnimationPlayer
# @onready var test_fact = $/facts/test_fact


func _ready() -> void:
	if Global.has_test_fact:
		$test_fact.queue_free()

func _on_scene_transition_1_body_entered(body: Node2D) -> void:
	#if body.has_method("player"):
		#print("transition")
	if body is Player:
		#print("transition")
		Scene_transition_animation.play("fade_in")
		await get_tree().create_timer(.5).timeout
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://scenes/screen_2.tscn")


#func _on_scene_transition_1_body_exited(body: Node2D) -> void:
	#pass # Replace with function body.
