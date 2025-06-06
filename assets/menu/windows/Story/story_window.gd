# story_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

func _ready():
	# Call parent _ready() for positioning
	super._ready()	
	$TextureRect/TextureButton.pressed.connect(_on_return_button_pressed)


func _on_return_button_pressed():
	WindowManager.close_window()
	
