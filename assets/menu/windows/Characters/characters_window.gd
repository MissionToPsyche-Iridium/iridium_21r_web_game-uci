# characters_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var lab_button = $Lab
@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	lab_button.pressed.connect(_on_lab_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

	$TextureRect/Icons/Col1/Claire.pressed.connect(_on_claire_button_pressed)
	$TextureRect/Icons/Col1/Yuno.pressed.connect(_on_yuno_button_pressed)
	$TextureRect/Icons/Col2/Dee.pressed.connect(_on_dee_button_pressed)
	$TextureRect/Icons/Col2/Zimbo.pressed.connect(_on_zimbo_button_pressed)
	$TextureRect/Icons/Col3/Skibby.pressed.connect(_on_skibby_button_pressed)

func _on_lab_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Lab/LabWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()
	
func _on_claire_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersScenes/Claire.tscn")

func _on_yuno_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersScenes/Yuno.tscn")

func _on_dee_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersScenes/Dee.tscn")

func _on_zimbo_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersScenes/Zimbo.tscn")

func _on_skibby_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersScenes/Skibby.tscn")
