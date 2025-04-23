class_name ObjectiveManager extends Node2D

static var instance: ObjectiveManager

enum Types {
	SCENE,
	AREA,
	MINING,
	INTERACTION,
	PURCHASE
}

"""
types of objectives:
	mining objective - track on ore's onDestroy
	scene objective - track what scene a player enters
		mining area, skibby/zimbo's shop, lab, space station, etc
	area objective - track a specific area trigger
	interaction objective - interact with a specific object
		lab computer
	shop objective - buy something from a shop
"""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (instance != null):
		instance.queue_free()
	instance = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_ore_mined(oreType: Ore.OreType) -> void:
	pass

func on_scene_load(scene_path: String) -> void:
	pass

func on_obj_area_entered(area_id: int) -> void:
	pass

func on_interact(interact_id: int) -> void:
	pass

func on_shop_purchase(shop_id: int, purchase_id: int) -> void:
	pass
