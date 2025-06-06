# about_window.gd
extends "res://assets/scripts/base_window.gd"  # Update this path if needed

@onready var characters_button = $Characters
@onready var lab_button = $Lab
@onready var close_button = $TextureRect/CloseButton

func _ready():
	# Call parent _ready() for positioning
	super._ready()

	characters_button.pressed.connect(_on_characters_button_pressed)
	lab_button.pressed.connect(_on_lab_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

	# Col1
	var laser = $TextureRect/Col1/Comms1
	_update_button_undiscovered(laser, ResourceManager.ItemTypes.FACT_LASER)
	laser.pressed.connect(_on_laser_button_pressed)

	var explosion = $TextureRect/Col1/Hits
	_update_button_undiscovered(explosion, ResourceManager.ItemTypes.FACT_EXPLOSION)
	explosion.pressed.connect(_on_explosion_button_pressed)

	var ruler = $TextureRect/Col1/Range
	_update_button_undiscovered(ruler, ResourceManager.ItemTypes.FACT_RULER)
	ruler.pressed.connect(_on_ruler_button_pressed)

	# Col2
	var radio = $TextureRect/Col2/Comms2
	_update_button_undiscovered(radio, ResourceManager.ItemTypes.FACT_RADIO)
	radio.pressed.connect(_on_radio_button_pressed)

	var monocle = $TextureRect/Col2/Naming
	_update_button_undiscovered(monocle, ResourceManager.ItemTypes.FACT_MONOCLE)
	monocle.pressed.connect(_on_monocle_button_pressed)

	var tennis = $TextureRect/Col2/Size
	_update_button_undiscovered(tennis, ResourceManager.ItemTypes.FACT_TENNIS)
	tennis.pressed.connect(_on_tennis_button_pressed)

	# Col3
	var paper = $TextureRect/Col3/Discovery
	_update_button_undiscovered(paper, ResourceManager.ItemTypes.FACT_PAPER)
	paper.pressed.connect(_on_paper_button_pressed)

	var phase = $TextureRect/Col3/Phase
	_update_button_undiscovered(phase, ResourceManager.ItemTypes.FACT_E)
	phase.pressed.connect(_on_phase_e_button_pressed)

	var atom = $TextureRect/Col3/Thrusters
	_update_button_undiscovered(atom, ResourceManager.ItemTypes.FACT_ATOM)
	atom.pressed.connect(_on_atom_button_pressed)

	# Col4
	var sun = $TextureRect/Col4/Energy
	_update_button_undiscovered(sun, ResourceManager.ItemTypes.FACT_SUN)
	sun.pressed.connect(_on_atom_button_pressed)

	var rocket = $TextureRect/Col4/Prediction
	_update_button_undiscovered(rocket, ResourceManager.ItemTypes.FACT_ROCKET)
	rocket.pressed.connect(_on_rocket_button_pressed)


func _update_button_undiscovered(button: TextureButton, item_id: ResourceManager.ItemTypes):
	if !ResourceManager.instance or !ResourceManager.instance.has_amount(item_id, 1):
		button.disabled = true
	else:
		button.disabled = false

func _on_characters_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersWindow.tscn")

func _on_lab_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Lab/LabWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()

func _on_atom_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Atom.tscn")

func _on_explosion_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Explosion.tscn")

func _on_laser_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Laser.tscn")

func _on_monocle_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/monocle.tscn")

func _on_paper_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Paper.tscn")

func _on_phase_e_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/PhaseE.tscn")

func _on_radio_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Radio.tscn")

func _on_rocket_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Rocket.tscn")

func _on_ruler_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Ruler.tscn")

func _on_sun_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Sun.tscn")

func _on_tennis_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/FactoidScenes/Tennis.tscn")
