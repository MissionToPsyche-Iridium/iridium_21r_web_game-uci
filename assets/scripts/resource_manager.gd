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
	STATION_UPGRADE_3,
	FACT_ATOM,
	FACT_E,
	FACT_EXPLOSION,
	FACT_LASER,
	FACT_MONOCLE,
	FACT_PAPER,
	FACT_RADIO,
	FACT_ROCKET,
	FACT_RULER,
	FACT_SUN,
	FACT_TENNIS,
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
	"Atom", #
	"Phase E", #
	"Explosion", #
	"Laser", #
	"Monocle", #
	"Paper", #
	"Radio", #
	"Rocket", #
	"Ruler", #
	"Sun", #
	"Tennis" #
	#"The Psyche spacecraft thrusters work by expelling charged atoms, or ions, of xenon, emitting a brilliant blue glow that trails behind the spacecraft.",
	#"The Psyche mission is currently in “Phase E.” This phase of the mission encompasses cruise (including a Mars gravity assist), arrival at the asteroid, and orbiting the asteroid.",
	#"The Pysche asteroid is most likely a survivor of multiple violent hit-and-run collisions, which was common when the solar system was forming.",
	#"The Psyche mission will test a sophisticated new laser communication technology that encodes data in photons at near-infrared wavelengths (rather than radio waves) to communicate between a probe in deep space and Earth. Using light instead of radio allows the spacecraft to communicate more data in a given amount of time.",
	#"Psyche was found in 1852 by Italian astronomer Annibale de Gasparis, named it for the goddess of the soul in ancient Greek mythology.",
	#"Psyche is only the 16th asteriod to be discovered!",
	#"After interfacing with the Psyche’s radio frequency transmitter, the laser communications demo sent a copy of engineering data from over 140 million miles (226 million kilometers) away.",
	#"The Psyche asteriod appears to be the exposed nickel-iron core of an early planet.",
	#"The Psyche asteroid is estimated to have a surface area of about 64,000 square miles.",
	#"The Psyche spacecraft has an incredibly efficient propulsion system, which is powered by sunlight.",
	#"The Psyche spacecraft (including the solar panels) is about the size of a singles tennis court."
]
const itemIcons:Array = [
	"res://assets/HUD/ore_sprites/copper.tres",
	"res://assets/HUD/ore_sprites/nickel.tres",
	"res://assets/HUD/ore_sprites/silver.tres",
	"res://assets/HUD/ore_sprites/tungsten.tres",
	"res://assets/HUD/ore_sprites/iridium.tres",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe1.png",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe2.png",
	"res://assets/ui assets/Shop/Pickaxe Icons/test_pickaxe3.png",
	"res://assets/buildings/space_station.png",
	"res://assets/buildings/space_station.png",
	"res://assets/buildings/space_station.png",
	"res://assets/fact_objects/Blue Atom.png",
	"res://assets/fact_objects/the letter e.png",
	"res://assets/fact_objects/explosion.png",
	"res://assets/fact_objects/laser.png",
	"res://assets/fact_objects/monocle.png",
	"res://assets/fact_objects/paper.png",
	"res://assets/fact_objects/radio.png",
	"res://assets/fact_objects/Rocket Thruster.png",
	"res://assets/fact_objects/pixil-frame-0 (25).png",
	"res://assets/fact_objects/Sun.png",
	"res://assets/fact_objects/tennis ball.png"
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
	add_to_inventory(ItemTypes.NICKEL_ORE, 10)
	add_to_inventory(ItemTypes.COPPER_ORE, 10)


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
