class_name Ore extends Node2D

enum OreType { COPPER, NICKEL, SILVER, TUNGSTEN, IRIDIUM }

@export var ore_type: OreType = OreType.COPPER
@export var ore_amount: int = 1
@export var hp: int = 50

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame = ore_type as int

func update_sprite() -> void:
	sprite.frame = ore_type as int

func on_hit(dmg: int) -> void:
	hp -= dmg
	if hp <= 0:
		perish()

func perish() -> void:
	ResourceManager.instance.add_to_inventory(toItemType(), ore_amount)

	if GameManager.instance != null:
		ObjectiveManager.instance.on_ore_mined(ore_type)
		
	queue_free()

func toItemType() -> ResourceManager.ItemTypes:
	match ore_type:
		OreType.COPPER:
			return ResourceManager.ItemTypes.COPPER_ORE
		OreType.NICKEL:
			return ResourceManager.ItemTypes.NICKEL_ORE
		OreType.SILVER:
			return ResourceManager.ItemTypes.SILVER_ORE
		OreType.TUNGSTEN:
			return ResourceManager.ItemTypes.TUNGSTEN_ORE
		OreType.IRIDIUM:
			return ResourceManager.ItemTypes.IRIDIUM_ORE
		_:
			return ResourceManager.ItemTypes.COPPER_ORE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
