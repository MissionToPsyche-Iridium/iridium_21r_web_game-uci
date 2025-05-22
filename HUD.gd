extends CanvasLayer

#Quick Inventory
@onready var copper: Label = $Control/QuickInventory/MarginContainer3/HBoxContainer2/LabelCopper
@onready var tungsten: Label = $Control/QuickInventory/MarginContainer2/HBoxContainer3/LabelTungsten
@onready var irridium: Label = $Control/QuickInventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var silver: Label = $Control/QuickInventory/MarginContainer4/HBoxContainer4/LabelSilver
@onready var nickel: Label = $Control/QuickInventory/MarginContainer5/HBoxContainer5/LabelNickel

#Big Inventory - ore
@onready var irridium2: Label = $BigInventory/Inventory/MarginContainer/HBoxContainer/LabelIrridium
@onready var copper2: Label = $BigInventory/Inventory/MarginContainer2/HBoxContainer/LabelCopper
@onready var tungsten2: Label = $BigInventory/Inventory/MarginContainer3/HBoxContainer/LabelTungsten
@onready var silver2: Label = $BigInventory/Inventory/MarginContainer4/HBoxContainer/LabelSilver
@onready var nickel2: Label = $BigInventory/Inventory/MarginContainer5/HBoxContainer/LabelNickel

#Big Inventory - collectibles
@onready var scope: Label = $BigInventory/Collectables/MarginContainer/HBoxContainer/ScopeAmt
@onready var radar: Label = $BigInventory/Collectables/MarginContainer2/HBoxContainer/RadarAmt
@onready var antenna: Label = $BigInventory/Collectables/MarginContainer3/HBoxContainer/AntennaAmt
@onready var battery: Label = $BigInventory/Collectables/MarginContainer4/HBoxContainer/BatteryAmt

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
	
	copper2.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.COPPER_ORE))
	tungsten2.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.TUNGSTEN_ORE))
	irridium2.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.IRIDIUM_ORE))
	silver2.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.SILVER_ORE))
	nickel2.text = "x " + str(ResourceManager.instance.get_amount(ResourceManager.ItemTypes.NICKEL_ORE))
	
	scope.text = "x 1000"
	radar.text = "x 550"
	antenna.text = "x 99"
	battery.text = "x 78"
	
	# testing for commit 
