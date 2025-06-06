extends CanvasLayer

# quick inventory items
@onready var copper: Label = $Control/QuickInventory/MarginContainer3/HBoxContainer2/LabelCopper
@onready var tungsten: Label = $Control/QuickInventory/MarginContainer2/HBoxContainer3/LabelTungsten
@onready var irridium: Label = $Control/QuickInventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var silver: Label = $Control/QuickInventory/MarginContainer4/HBoxContainer4/LabelSilver
@onready var nickel: Label = $Control/QuickInventory/MarginContainer5/HBoxContainer5/LabelNickel

# big inventory items
@onready var bcopper: Label = $BigInventory/ScrollContainer/VBoxContainer/Inventory/MarginContainer2/HBoxContainer/LabelCopper
@onready var btungsten: Label = $BigInventory/ScrollContainer/VBoxContainer/Inventory/MarginContainer3/HBoxContainer/LabelTungsten
@onready var birridium: Label = $BigInventory/ScrollContainer/VBoxContainer/Inventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var bsilver: Label = $BigInventory/ScrollContainer/VBoxContainer/Inventory/MarginContainer4/HBoxContainer/LabelSilver
@onready var bnickel: Label = $BigInventory/ScrollContainer/VBoxContainer/Inventory/MarginContainer5/HBoxContainer/LabelNickel

# collectibles
@onready var collectibles : VBoxContainer = $BigInventory/ScrollContainer/VBoxContainer/Collectibles
#var inventory_slot: PackedScene = preload("res://collectibles_bigInventory.tscn")
var item_type : ResourceManager.ItemTypes
var collectibleEntryPrefab: Resource = preload("res://collectibles_bigInventory.tscn")

# makes inventory visible
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventory"):
		$BigInventory.visible = !$BigInventory.visible
		
"""
func create_collectible(item_type) -> CollectibleBigInventory:
	var item : CollectibleBigInventory = collectibleEntryPrefab.instantiate()
	item.get_icon(item_type)
	item.get_title(item_type)
	return item

	
func create_slot(item_type) -> void:
	collectibles.add_child(create_collectible(item_type))
	"""
	
func _ready() -> void:
	#ResourceManager.instance.onInventoryUpdate.connect(_on_inventory_update)
	$BigInventory.visible = false;
"""
func _on_inventory_update(item_type: ResourceManager.ItemTypes, amount: int) -> void:
	# if item_type is one of the collectibles
	if item_type == ResourceManager.ItemTypes.FACT_ATOM || item_type == ResourceManager.ItemTypes.FACT_PAPER || item_type == ResourceManager.ItemTypes.FACT_E || item_type == ResourceManager.ItemTypes.FACT_LASER || item_type == ResourceManager.ItemTypes.FACT_EXPLOSION || item_type == ResourceManager.ItemTypes.FACT_MONOCLE || item_type == ResourceManager.ItemTypes.FACT_RADIO || item_type == ResourceManager.ItemTypes.FACT_ROCKET || item_type == ResourceManager.ItemTypes.FACT_RULER || item_type == ResourceManager.ItemTypes.FACT_SUN || item_type == ResourceManager.ItemTypes.FACT_TENNIS:
		create_slot(item_type)
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	copper.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.COPPER_ORE))
	tungsten.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.TUNGSTEN_ORE))
	irridium.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.IRIDIUM_ORE))
	silver.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.SILVER_ORE))
	nickel.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.NICKEL_ORE))
	
	bcopper.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.COPPER_ORE))
	btungsten.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.TUNGSTEN_ORE))
	birridium.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.IRIDIUM_ORE))
	bsilver.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.SILVER_ORE))
	bnickel.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.NICKEL_ORE))
	

	
