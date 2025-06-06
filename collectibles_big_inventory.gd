class_name CollectibleBigInventory extends MarginContainer

@onready var title: Label = $MarginContainer/HBoxContainer/Name
@onready var image: TextureRect = $MarginContainer/HBoxContainer/Img

var item_type : ResourceManager.ItemTypes
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
"""
func get_title(item_type: ResourceManager.ItemTypes) -> void:
	title.text = ResourceManager.instance.ItemTypeToString(item_type)
	
func get_icon(item_type: ResourceManager.ItemTypes) -> void:
	var texture_path = load(ResourceManager.itemIcons[item_type])
	image.texture = texture_path.get_image()
"""	
