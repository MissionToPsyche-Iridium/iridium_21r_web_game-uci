class_name Shop extends CanvasLayer

#@onready var Scene_transition_animation = $scene_transition1/transition_animation/AnimationPlayer
enum ShopId {
	NONE,
	STATION,
	ZIMBO,
	SKIBBY_DEE
}

@export var shopId: ShopId
#Create button
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var buttonContainer: VBoxContainer = $PanelContainer/VBoxContainer
@onready var exit_button = $Button
@export var buttons: Array[ShopButton]
const buttonPrefab: Resource = preload("res://assets/prefabs/shop/shop_button.tscn")
const costPrefab: Resource = preload("res://assets/prefabs/shop/cost.tscn")

# Transaction data: all of these must be the same length as buttons
#@export var transactionTypes: Array[ResourceManager.ItemTypes]
#@export var transactionQuantities: Array[int]
#@export var transactionCostTypes: Array[ResourceManager.ItemTypes]
#@export var transactionCostQuantities: Array[int]

@export var transactions: Array[Transaction]

#Text box
@onready var dialogue_box = $PanelContainer2/RichTextLabel

@export var exit_scene: String = "res://scenes/demo_indoor.tscn"
@export var exit_spawnPos: Vector2 = Vector2(588, 350)

var purchase_delay: float = 3.0
var _purchase_timer: float = 0.0
var purchased: bool = false

@export var default_text: String = "[center]I can upgrade your pickaxe in order to mine ores better![/center]"
@export var successful_purchase_text: String = "[center]Thanks! Here's your %s.[/center]"
@export var failed_purchase_text: String = "[center]Sorry, it looks like you don't have enough.[/center]"
@export var anything_else_text: String = "[center]Anything else I can get for you?[/center]"
@export var leave_text: String = "[center]See you later![/center]"

var exit_delay: float = 1.5
var _exit_timer: float = 0.0
var exit: bool = false

signal exited



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create button's listeners
	
	_setup_buttons()
	_purchase_timer = 0
	purchased = false
	exit = false
	exit_button.button_down.connect(on_exit_press)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (purchased):
		_purchase_timer += delta
		if _purchase_timer > purchase_delay:
			anything_else_popup()
	#if(exit):
		#_exit_timer += delta
		#if _exit_timer > exit_delay:
			#leaving_popup()

func enter_animation() -> void:
	animationPlayer.play("Enter")
	dialogue_box.text=default_text

func exit_animation() -> void:
	animationPlayer.play("Exit")

func anything_else_popup():
	dialogue_box.text=anything_else_text
	purchased = false
	
func leaving_popup():
	dialogue_box.text=leave_text
	exit = true

func _setup_buttons() -> void:
	for i in range(0, len(transactions)):
		var button: ShopButton = buttonPrefab.instantiate()
		buttonContainer.add_child(button)
		buttons.append(button)
		var itemType = transactions[i].transactionType
		var itemQuantity = transactions[i].transactionQuantity
		var costTypes = transactions[i].transactionCostTypes
		var costQuantities = transactions[i].transactionCostQuantities
		
		var lambda = func()->void:
			attempt_purchase(i)
		button.button_down.connect(lambda)
		var iconFile = transactions[i].transactionType
		button.icon = load(ResourceManager.itemIcons[iconFile])
		button.itemQuantity.text = "x%s" % itemQuantity
		button.text = ResourceManager.itemStrings[itemType]
		for j in range(0, len(costTypes)):
			var cost: Cost = costPrefab.instantiate()
			button.add_child(cost)
			cost.position = Vector2(259 - (j * 40), 32)
			cost.costIcon.texture = load(ResourceManager.itemIcons[costTypes[j]])
			cost.costQuantity.text = "[right]x%s" % costQuantities[j]
			#button.costIcon.texture = load(ResourceManager.itemIcons[costType])
			#button.costQuantity.text = "[right]x%s" % costQuantity
		print(len(buttons))
	
	
	#for i in range(0, len(transactionTypes)):
		#var button: ShopButton = buttonPrefab.instantiate()
		#buttonContainer.add_child(button)
		#buttons.append(button)
		#var itemType = transactionTypes[i]
		#var itemQuantity = transactionQuantities[i]
		#var costType = transactionCostTypes[i]
		#var costQuantity = transactionCostQuantities[i]
		#var lambda = func() -> void:
			#attempt_purchase(i)
		#button.button_down.connect(lambda)
		#button.icon = load(ResourceManager.itemIcons[itemType])
		#button.itemQuantity.text = "x%s" % itemQuantity
		#button.text = ResourceManager.itemStrings[itemType]
		#button.costIcon.texture = load(ResourceManager.itemIcons[costType])
		#button.costQuantity.text = "[right]x%s" % costQuantity
	#print(len(buttons))
	

func attempt_purchase(index: int) -> void:
	var playerInventory = ResourceManager.instance
	print("purchasing: %s" % index)
	var itemType = transactions[index].transactionType
	var itemQuantity = transactions[index].transactionQuantity
	var costTypes = transactions[index].transactionCostTypes
	var costQuantities = transactions[index].transactionCostQuantities
	
	if playerInventory != null and playerInventory.has_amounts(costTypes, costQuantities):
		for i in range(0, len(costTypes)):
			playerInventory.remove_from_inventory(costTypes[i], costQuantities[i])
		playerInventory.add_to_inventory(itemType, itemQuantity)
		dialogue_box.text=successful_purchase_text % ResourceManager.itemStrings[itemType]
		ObjectiveManager.instance.on_shop_purchase(shopId, index)
		
	else:
		dialogue_box.text=failed_purchase_text
	on_purchase()

func on_purchase():
	purchased = true
	_purchase_timer = 0
	
func on_exit():
	leaving_popup()
	purchased = false
	_exit_timer = 0	
	exited.emit()
	exit_animation()
# func on_leaving():
#	Scene_transition_animation.play("fade_in")
#	await get_tree().create_timer(.5).timeout
#	var scene_tree = get_tree()
#	scene_tree.change_scene_to_file("res://scenes/screen_1.tscn")

# Button event functions
func on_iri_press():
	print("pressed iridium button")
	dialogue_box.text="[center]Thanks! Here's your iridium![/center]"
	on_purchase()
	
func on_bron_press():
	print("pressed bronze button")
	dialogue_box.text="[center]Thanks! Here's your bronze![/center]"
	on_purchase()

func on_tung_press():
	print("pressed tungsten button")
	dialogue_box.text="[center]Thanks! Here's your tungsten![/center]"
	on_purchase()
	
func on_peri_press():
	print("pressed peridot button")
	dialogue_box.text="[center]Thanks! Here's your peridot![/center]"
	on_purchase()
	
func on_ni_press():
	print("pressed nickel button")
	dialogue_box.text="[center]Thanks! Here's your nickel![/center]"
	on_purchase()
	
func on_exit_press():
	print("exiting...")
	on_exit()
	
