extends Node2D

@onready var Scene_transition_animation = $scene_transition2/transition_animation/AnimationPlayer
#$scene_transition1/transition_animation/AnimationPlayer

func _on_scene_transition_2_body_entered(body: Node2D) -> void:
	if body is Player:
		print("transition")
		Scene_transition_animation.play("fade_in")
		await get_tree().create_timer(.5).timeout
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://scenes/screen1.tscn")


#func _on_scene_transition_2_body_exited(body: Node2D) -> void:
	#pass # Replace with function body.
