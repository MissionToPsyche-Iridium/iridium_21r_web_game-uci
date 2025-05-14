class_name ResourceManager extends Node2D

enum ItemTypes {
	COPPER_ORE,
	NICKEL_ORE,
	SILVER_ORE,
	TUNGSTEN_ORE,
	IRIDIUM_ORE,
	PICKAXE_UPGRADE_1,
	PICKAXE_UPGRADE_2,
	PICKAXE_UPGRADE_3,
	STATION_UPGRADE_1,
	STATION_UPGRADE_2,
	STATION_UPGRADE_3
}
const itemStrings:Array = [
	"Copper Ore",
	"Nickel Ore",
	"Silver Ore",
	"Tungsten Ore",
	"Iridium Ore",
	"Silver Pickaxe",
	"Tungsten Pickaxe",
	"Iridium Pickaxe",
	"Space Station Upgrade 1",
	"Space Station Upgrade 2",
	"Space Station Upgrade 3",
]
const itemIcons:Array = [
	"res://assets/ui assets/Shop/Ore Icons/Bronze.png",
	"res://assets/ui assets/Shop/Ore Icons/Nickel.png",
	"res://assets/ui assets/Shop/Ore Icons/Peridot.png", #change this later
	"res://assets/ui assets/Shop/Ore Icons/Tungsten.png",
	"res://assets/ui assets/Shop/Ore Icons/Iridium.png",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe1.png",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe2.png",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe3.png",
	"res://assets/ui assets/Shop/Ore Icons/Iridium.png",
	"res://assets/ui assets/Shop/Ore Icons/Iridium.png",
	"res://assets/ui assets/Shop/Ore Icons/Iridium.png",
]

signal onInventoryUpdate(item_type: ItemTypes, amount: int)

static var instance:ResourceManager = null
var inventory:Array = []
var pickaxeTier:int = 0
var stationTier:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self
	for i in ItemTypes.keys():
		inventory.append(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func has_amount(item_type: ItemTypes, amount: int) -> bool:
	return inventory[item_type] >= amount

func has_amounts(item_types: Array[ItemTypes], amounts: Array[int]) -> bool:
	for i in range(0, len(item_types)):
		if inventory[item_types[i]] < amounts[i]:
			return false
	return true

func get_amount(item_type: ItemTypes) -> int:
	return inventory[item_type];

func add_to_inventory(item_type: ItemTypes, amount: int) -> void:
	inventory[item_type] += amount
	match item_type:
		ItemTypes.PICKAXE_UPGRADE_1:
			pickaxeTier = 1
		ItemTypes.PICKAXE_UPGRADE_2:
			pickaxeTier = 2
		ItemTypes.PICKAXE_UPGRADE_3:
			pickaxeTier = 3
		ItemTypes.STATION_UPGRADE_1:
			stationTier = 1
		ItemTypes.STATION_UPGRADE_2:
			stationTier = 2
		ItemTypes.STATION_UPGRADE_3:
			stationTier = 3
	print("pickaxe tier: %s" % pickaxeTier)
	print("stationTier: %s" % stationTier)
	print("%s x%s" % [ItemTypeToString(item_type), amount])
	onInventoryUpdate.emit(item_type, amount)

# Make sure to check that the inventory has_amount before removing
func remove_from_inventory(item_type: ItemTypes, amount: int) -> void:
	inventory[item_type] -= amount
	onInventoryUpdate.emit(item_type, -amount)

static func ItemTypeToString(item_type: ItemTypes) -> String:
	return itemStrings[item_type]
