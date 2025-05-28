# lab_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var characters_button = $Characters
@onready var about_button = $About
@onready var close_button = $TextureRect/CloseButton

const undiscovered_texture: Texture = preload("res://assets/menu/windows/Lab/Undiscovered.png")


func _ready():
	# Call parent _ready() for positioning
	super._ready()
	
	characters_button.pressed.connect(_on_characters_button_pressed)
	about_button.pressed.connect(_on_about_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)
	#$TextureRect/ScrollContainer.get_v_scroll_bar().rect_ = 50
	var atom = $TextureRect/ScrollContainer/Icons/Col1/Atom
	var laser = $TextureRect/ScrollContainer/Icons/Col1/Laser
	var radio = $TextureRect/ScrollContainer/Icons/Col1/Radio
	var sun = $TextureRect/ScrollContainer/Icons/Col1/Sun
	
	var phase = $"TextureRect/ScrollContainer/Icons/Col2/Phase E"
	var monocle = $TextureRect/ScrollContainer/Icons/Col2/Monocle
	var rocket = $TextureRect/ScrollContainer/Icons/Col2/Rocket
	var tennis = $TextureRect/ScrollContainer/Icons/Col2/Tennis
	
	var explosion = $TextureRect/ScrollContainer/Icons/Col3/Explosion
	var paper = $TextureRect/ScrollContainer/Icons/Col3/Paper
	var ruler = $TextureRect/ScrollContainer/Icons/Col3/Ruler
	
	_update_button_undiscovered(atom, ResourceManager.ItemTypes.FACT_ATOM)
	atom.pressed.connect(_on_atom_button_pressed)
	_update_button_undiscovered(laser, ResourceManager.ItemTypes.FACT_LASER)
	laser.pressed.connect(_on_laser_button_pressed)
	_update_button_undiscovered(radio, ResourceManager.ItemTypes.FACT_RADIO)
	radio.pressed.connect(_on_radio_button_pressed)
	_update_button_undiscovered(sun, ResourceManager.ItemTypes.FACT_SUN)
	sun.pressed.connect(_on_atom_button_pressed)
	
	_update_button_undiscovered(phase, ResourceManager.ItemTypes.FACT_E)
	phase.pressed.connect(_on_phase_e_button_pressed)
	_update_button_undiscovered(monocle, ResourceManager.ItemTypes.FACT_MONOCLE)
	monocle.pressed.connect(_on_monocle_button_pressed)
	_update_button_undiscovered(rocket, ResourceManager.ItemTypes.FACT_ROCKET)
	rocket.pressed.connect(_on_rocket_button_pressed)
	_update_button_undiscovered(tennis, ResourceManager.ItemTypes.FACT_TENNIS)
	tennis.pressed.connect(_on_tennis_button_pressed)
	
	_update_button_undiscovered(explosion, ResourceManager.ItemTypes.FACT_EXPLOSION)
	explosion.pressed.connect(_on_explosion_button_pressed)
	_update_button_undiscovered(paper, ResourceManager.ItemTypes.FACT_PAPER)
	paper.pressed.connect(_on_paper_button_pressed)
	_update_button_undiscovered(ruler, ResourceManager.ItemTypes.FACT_RULER)
	ruler.pressed.connect(_on_ruler_button_pressed)

func _update_button_undiscovered(button: TextureButton, item_id: ResourceManager.ItemTypes):
	if !ResourceManager.instance or !ResourceManager.instance.has_amount(item_id, 1):
		button.texture_normal = undiscovered_texture
		button.texture_pressed = undiscovered_texture
		button.texture_hover = undiscovered_texture

func _on_characters_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersWindow.tscn")

func _on_about_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/AboutPsyche/AboutPsycheWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()

func _on_atom_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_ATOM, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Atom.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_explosion_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_EXPLOSION, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Explosion.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_laser_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_LASER, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Laser.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_monocle_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_MONOCLE, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/monocle.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_paper_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_PAPER, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Paper.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_phase_e_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_E, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/PhaseE.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_radio_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_RADIO, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Radio.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_rocket_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_ROCKET, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Rocket.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_ruler_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_RULER, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Ruler.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_sun_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_SUN, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Sun.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")

func _on_tennis_button_pressed():
	if ResourceManager.instance and ResourceManager.instance.has_amount(ResourceManager.ItemTypes.FACT_TENNIS, 1):
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Tennis.tscn")
	else:
		WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Undiscovered.tscn")
