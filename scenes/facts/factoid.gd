extends Area2D

@onready var interactable: Area2D = $Interactable
@onready var sprite: Sprite2D = $Sprite2D
@export var item_id: ResourceManager.ItemTypes = ResourceManager.ItemTypes.FACT_ATOM

var fact_id = "explosion"
var factoid = "The Pysche asteroid is most likely a survivor of multiple violent hit-and-run collisions, which was common when the solar system was forming."

func _ready() -> void:
	sprite.texture = load(ResourceManager.itemIcons[item_id])
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_explosion = true
	self.visible = false
	if ResourceManager.instance:
		ResourceManager.instance.add_to_inventory(item_id, 1)
	print("get interacted")
	Dialogic.start_timeline("call_from_claire")
