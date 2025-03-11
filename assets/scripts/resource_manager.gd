class_name ResourceManager extends Node2D

enum ItemTypes {
	COPPER_ORE,
	NICKEL_ORE,
	SILVER_ORE,
	TUNGSTEN_ORE,
	IRIDIUM_ORE
}
const itemStrings:Array = [
	"Copper Ore",
	"Nickel Ore",
	"Silver Ore",
	"Tungsten Ore",
	"Iridium Ore"
]

static var instance:ResourceManager = null
var inventory:Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self
	for i in ItemTypes.keys():
		inventory.append(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func has_amount(item_type: ItemTypes, amount: int) -> bool:
	return inventory[item_type] >= amount

func add_to_inventory(item_type: ItemTypes, amount: int) -> void:
	inventory[item_type] += amount
	print("%s x%s" % [ItemTypeToString(item_type), amount])

# Make sure to check that the inventory has_amount before removing
func remove_from_inventory(item_type: ItemTypes, amount: int) -> void:
	inventory[item_type] -= amount

static func ItemTypeToString(item_type: ItemTypes) -> String:
	return itemStrings[item_type]
