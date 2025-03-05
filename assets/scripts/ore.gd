class_name Ore extends Node2D

enum OreType { COPPER, NICKEL, SILVER, TUNGSTEN, IRIDIUM }

@export var ore_type: OreType = OreType.COPPER
@export var hp: int = 50

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame = ore_type as int

func on_hit(dmg: int) -> void:
	print(dmg)
	hp -= dmg
	if hp <= 0:
		perish()

func perish() -> void:
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
