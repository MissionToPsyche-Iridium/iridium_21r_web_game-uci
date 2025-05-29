# characters_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var lab_button = $Lab
@onready var about_button = $About
@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	lab_button.pressed.connect(_on_lab_button_pressed)
	about_button.pressed.connect(_on_about_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

	# Col1
	$TextureRect/Icons/Col1/Claire.pressed.connect(_on_claire_button_pressed)
	var yuno = $TextureRect/Icons/Col1/Yuno
	_update_button_undiscovered(yuno, Dialogic.VAR.has_met_yuno)
	yuno.pressed.connect(_on_yuno_button_pressed)

	# Col2
	var dee = $TextureRect/Icons/Col2/Dee
	_update_button_undiscovered(dee, Dialogic.VAR.has_met_dee)
	dee.pressed.connect(_on_dee_button_pressed)

	var zimbo = $TextureRect/Icons/Col2/Zimbo
	_update_button_undiscovered(zimbo, Dialogic.VAR.has_met_zimbo)
	zimbo.pressed.connect(_on_zimbo_button_pressed)

	# Col3
	var skibby = $TextureRect/Icons/Col3/Skibby
	_update_button_undiscovered(skibby, Dialogic.VAR.has_met_skibby)
	skibby.pressed.connect(_on_skibby_button_pressed)

func _update_button_undiscovered(button: TextureButton, visible: bool):
	if !visible:
		button.disabled = true
	else:
		button.disabled = false

func _on_lab_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Lab/LabWindow.tscn")

func _on_about_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/AboutPsyche/AboutPsycheWindow.tscn")

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
