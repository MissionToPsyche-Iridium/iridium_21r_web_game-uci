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

	# Col1
	var copper = $TextureRect/Icons/Col1/Copper
	_update_button_undiscovered(copper, ResourceManager.ItemTypes.COPPER_ORE)
	copper.pressed.connect(_on_copper_button_pressed)

	var silver = $TextureRect/Icons/Col1/Silver
	_update_button_undiscovered(silver, ResourceManager.ItemTypes.SILVER_ORE)
	silver.pressed.connect(_on_silver_button_pressed)

	# Col2
	var iridium = $TextureRect/Icons/Col2/Iridium
	_update_button_undiscovered(iridium, ResourceManager.ItemTypes.IRIDIUM_ORE)
	iridium.pressed.connect(_on_iridium_button_pressed)

	var tungsten = $TextureRect/Icons/Col2/Tungsten
	_update_button_undiscovered(tungsten, ResourceManager.ItemTypes.TUNGSTEN_ORE)
	tungsten.pressed.connect(_on_tungsten_button_pressed)

	# Col3
	var nickel = $TextureRect/Icons/Col3/Nickel
	_update_button_undiscovered(nickel, ResourceManager.ItemTypes.NICKEL_ORE)
	nickel.pressed.connect(_on_nickel_button_pressed)

func _update_button_undiscovered(button: TextureButton, item_id: ResourceManager.ItemTypes):
	if !ResourceManager.instance or !ResourceManager.instance.has_amount(item_id, 1):
		button.disabled = true
	else:
		button.disabled = false

func _on_characters_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersWindow.tscn")

func _on_about_button_pressed():
	WindowManager.close_window()
	WindowManager.open_window("res://assets/menu/windows/AboutPsyche/AboutPsycheWindow.tscn")

func _on_close_button_pressed():
	WindowManager.close_window()

func _on_copper_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabScenes/Copper.tscn")

func _on_silver_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabScenes/Silver.tscn")

func _on_iridium_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabScenes/Iridium.tscn")

func _on_tungsten_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabScenes/Tungsten.tscn")

func _on_nickel_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabScenes/Nickel.tscn")
