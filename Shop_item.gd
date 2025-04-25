class_name ShopItem 

var itemType: ResourceManager.ItemTypes
var cost: Array #itemType, quantity
var returnQuanitity: Array #itemType, quantitiy

#creates buttons for the shop
func create_button(item) -> Button:
	var itemButton: Button
	itemButton.text = item.name
	var texture_file_path: String #insert file name here
	itemButton.icon = item.item_icon # REPLACE WITH ACTUAL FILE PATH
	return itemButton
	
func trade(item):
	if ResourceManager.instance.has_amount(itemType, item.cost):
		ResourceManager.instance.remove_from_inventory(itemType, item.cost)
		ResourceManager.instance.add_to_inventory(itemType, item.returnQuantitity)
	else:
		print("You do not have enough for this.")	
	return 
	
	





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
