extends Node2D

@onready var ore: Ore = $Ore

@export var spawnChance: float = 0.75
@export var orePool: Array[Ore.OreType] # ore types to generate
@export var amountPool: Array[int] # amounts to give

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (spawnChance < randf_range(0.0, 1.0)):
		ore.set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
