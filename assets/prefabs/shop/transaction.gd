class_name Transaction extends Node2D

@export var transactionType: ResourceManager.ItemTypes
@export var transactionQuantity: int
@export var transactionCostTypes: Array[ResourceManager.ItemTypes]
@export var transactionCostQuantities: Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
