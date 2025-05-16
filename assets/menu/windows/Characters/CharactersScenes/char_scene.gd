#char_scene.gd
extends "res://assets/scripts/base_window.gd"

@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	close_button.pressed.connect(_on_close_button_pressed)

func _on_close_button_pressed():
	WindowManager.close_window()
