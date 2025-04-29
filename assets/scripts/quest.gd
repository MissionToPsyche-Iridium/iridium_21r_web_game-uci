class_name Quest extends Node

enum QuestType {
	NONE,
	SCENE,
	AREA,
	MINING,
	INTERACTION,
	PURCHASE
}

@export var questType: QuestType
@export var questName: String
@export var questDescription: String

# mining objective
@export var oreType: Ore.OreType = Ore.OreType.COPPER
@export var miningNeeded: int = -1

# scene objective
@export var sceneId: GameScene.SceneId = GameScene.SceneId.NONE

# area objective
@export var areaId: int = -1

# interaction objective
@export var interactionId: int = -1

# shop objective
@export var shopId: int = -1
@export var purchaseId: int = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
