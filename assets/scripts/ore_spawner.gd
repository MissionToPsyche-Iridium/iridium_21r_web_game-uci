extends Node2D

@onready var ore: Ore = $Ore

@export var spawnChance: float = 0.75
@export var orePool: Array[Ore.OreType] # ore types to generate
@export var amountPool: Array[int] # amounts to give

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_ore()
	pass # Replace with function body.

func generate_ore() -> void:
	var a = randf_range(0.0, 1.0)
	if (spawnChance < a):
		ore.queue_free()
	else:
		var oreIndex = randi_range(0, len(orePool) - 1)
		ore.ore_type = orePool[oreIndex]
		ore.update_sprite()
		var amountIndex = randi_range(0, len(amountPool) - 1)
		ore.ore_amount = amountPool[amountIndex]
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
