# credits_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	$TextureRect/CloseButton.pressed.connect(_on_close_button_pressed)

func _on_close_button_pressed():
	WindowManager.close_window()
	
