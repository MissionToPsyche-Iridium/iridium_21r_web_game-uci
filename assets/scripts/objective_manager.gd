class_name ObjectiveManager extends Node2D

static var instance: ObjectiveManager

#enum QuestType {
	#NONE,
	#SCENE,
	#AREA,
	#MINING,
	#INTERACTION,
	#PURCHASE
#}

@export var questList: Array[Quest]
@onready var titleText: RichTextLabel = $CanvasLayer/QuestUI/Title
@onready var descriptionText: RichTextLabel = $CanvasLayer/QuestUI/Description
@onready var progressText: RichTextLabel = $CanvasLayer/QuestUI/Progress
@onready var progressBar: ProgressBar = $CanvasLayer/QuestUI/ProgressBar
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var currentQuestId: int = 0
var currentType: Quest.QuestType = Quest.QuestType.NONE
var currentName: String = ""
var currentDescription: String = ""

# mining objective
var oreType: Ore.OreType = Ore.OreType.COPPER
var miningNeeded: int = -1
var miningProgress: int = 0

# scene objective
var sceneId: GameScene.SceneId = GameScene.SceneId.NONE

# area objective
var areaId: int = -1

# interaction objective
var interactionId: int = -1

# shop objective
var shopId: Shop.ShopId = Shop.ShopId.NONE
var purchaseId: int = -1

"""
types of objectives:
	mining objective - track on ore's onDestroy
		- ore type, ore mined
	scene objective - track what scene a player enters
		mining area, skibby/zimbo's shop, lab, space station, etc
		- scene id
	area objective - track a specific area trigger
		- area id
	interaction objective - interact with a specific object
		lab computer
		- object id
	shop objective - buy something from a shop
		- shop id
		- purchase id
"""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (instance != null):
		instance.queue_free()
	instance = self
	#currentQuestId = -1
	#next_objective()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_ui() -> void:
	titleText.text = currentName
	descriptionText.text = currentDescription
	match currentType:
		Quest.QuestType.MINING:
			progressText.text = "%d / %d" % [miningProgress, miningNeeded]
			progressBar.visible = true
			progressBar.max_value = miningNeeded
			progressBar.value = miningProgress
		_:
			progressText.text = ""
			progressBar.visible = false
			

func set_quest(id: int) -> void:
	var quest = questList[id]
	currentQuestId = id
	currentType = quest.questType
	currentName = quest.questName
	currentDescription = quest.questDescription
	
	oreType = quest.oreType
	miningNeeded = quest.miningNeeded
	miningProgress = 0
	
	sceneId = quest.sceneId
	
	areaId = quest.areaId
	
	interactionId = quest.interactionId
	
	shopId = quest.shopId
	
	purchaseId = quest.purchaseId
	
	update_ui()
	animationPlayer.play("startQuest")
	print("quest: %s" % currentName)

func next_objective() -> void:
	clear_objective()
	if (currentQuestId < len(questList) - 1):
		set_quest(currentQuestId + 1)
	

func complete_objective() -> void:
	print("quest complete")
	animationPlayer.play("completeQuest")

func clear_objective() -> void:
	match (currentType):
		Quest.QuestType.SCENE:
			sceneId = GameScene.SceneId.NONE
		Quest.QuestType.AREA:
			areaId = -1
		Quest.QuestType.MINING:
			miningNeeded = -1
			miningProgress = -1
		Quest.QuestType.INTERACTION:
			interactionId = -1
		Quest.QuestType.PURCHASE:
			shopId = Shop.ShopId.NONE
			purchaseId = -1
	currentType = Quest.QuestType.NONE

func on_ore_mined(oreType: Ore.OreType) -> void:
	if currentType == Quest.QuestType.MINING and oreType == self.oreType:
		miningProgress += 1
		update_ui()
		if (miningProgress >= miningNeeded):
			complete_objective()
	
func on_scene_load(scene_id: int) -> void:
	if currentType == Quest.QuestType.SCENE and scene_id == sceneId:
		complete_objective()

func on_obj_area_entered(area_id: int) -> void:
	if currentType == Quest.QuestType.AREA and area_id == areaId:
		complete_objective()

func on_interact(interact_id: int) -> void:
	if currentType == Quest.QuestType.INTERACTION and interact_id == interactionId:
		complete_objective()

func on_shop_purchase(shop_id: int, purchase_id: int) -> void:
	if currentType == Quest.QuestType.PURCHASE and shop_id == shopId and purchase_id == purchaseId:
		complete_objective()
