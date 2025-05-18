class_name ShopButton extends Button

@onready var itemQuantity: RichTextLabel = $ItemQuantity
@onready var costIcon: TextureRect = $Cost/CostIcon
@onready var costQuantity: RichTextLabel = $Cost/CostQuantity


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
