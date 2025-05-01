class_name StartMenu extends Control

signal on_start_pressed()

#@onready var Scene_transition_animation =  $transition_animation/AnimationPlayer

func _on_start_button_pressed() -> void:
	print("clicked")
	on_start_pressed.emit()
	#pass
	#Scene_transition_animation.play("fade_in")
	#await get_tree().create_timer(.5).timeout
	#var scene_tree = get_tree()
	#scene_tree.change_scene_to_file("res://Scenes/screen1.tscn")
