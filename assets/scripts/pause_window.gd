# pause_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	$TextureRect/TextureButton.pressed.connect(_on_return_button_pressed)
	get_tree().paused = true

func _on_return_button_pressed():
	get_tree().paused = false
	WindowManager.close_window()
	
