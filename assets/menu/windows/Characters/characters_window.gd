# characters_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var lab_button = $Lab
@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	lab_button.pressed.connect(_on_lab_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

func _on_lab_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Lab/LabWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()
