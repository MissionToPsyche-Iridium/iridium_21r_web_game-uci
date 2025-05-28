# lab_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var characters_button = $Characters
@onready var about_button = $About
@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	characters_button.pressed.connect(_on_characters_button_pressed)
	about_button.pressed.connect(_on_about_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

func _on_characters_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersWindow.tscn")

func _on_about_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/AboutPsyche/AboutPsycheWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()
