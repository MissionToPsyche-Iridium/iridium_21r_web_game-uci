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
const itemIcons:Array = [
	"res://assets/ui assets/Shop/Ore Icons/Bronze.png",
	"res://assets/ui assets/Shop/Ore Icons/Nickel.png",
	"res://assets/ui assets/Shop/Ore Icons/Peridot.png", #change this later
	"res://assets/ui assets/Shop/Ore Icons/Tungsten.png",
	"res://assets/ui assets/Shop/Ore Icons/Iridium.png"
]

static var instance:ResourceManager = null
var inventory:Array = []
var pickaxeTier:int = 0

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
