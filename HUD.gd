extends CanvasLayer

@onready var copper: Label = $Control/QuickInventory/MarginContainer3/HBoxContainer2/LabelCopper
@onready var tungsten: Label = $Control/QuickInventory/MarginContainer2/HBoxContainer3/LabelTungsten
@onready var irridium: Label = $Control/QuickInventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var silver: Label = $Control/QuickInventory/MarginContainer4/HBoxContainer4/LabelSilver
@onready var nickel: Label = $Control/QuickInventory/MarginContainer5/HBoxContainer5/LabelNickel

@onready var bcopper: Label = $BigInventory/Inventory/MarginContainer2/HBoxContainer/LabelCopper
@onready var btungsten: Label = $BigInventory/Inventory/MarginContainer3/HBoxContainer/LabelTungsten
@onready var birridium: Label = $BigInventory/Inventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var bsilver: Label = $BigInventory/Inventory/MarginContainer4/HBoxContainer/LabelSilver
@onready var bnickel: Label = $BigInventory/Inventory/MarginContainer5/HBoxContainer/LabelNickel

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventory"):
		$BigInventory.visible = !$BigInventory.visible

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
	# testing for commit 
