extends Node2D

@export var transition_trigger: Area2D
@onready var stage0Sprite: TileMapLayer = $Stage0
@onready var stage1Sprite: TileMapLayer = $Stage1
@onready var stage2Sprite: TileMapLayer = $Stage2
@onready var stage3Sprite: TileMapLayer = $Stage3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ResourceManager.instance != null:
		ResourceManager.instance.onInventoryUpdate.connect(onInventoryUpdate)
	updateSprite()

func updateSprite() -> void:
	if ResourceManager.instance == null: return
	stage0Sprite.visible = true
	#stage1Sprite.visible = false
	#stage2Sprite.visible = false
	#stage3Sprite.visible = false
	#match ResourceManager.instance.stationTier:
		#1:
			#stage1Sprite.visible = true
		#2:
			#stage2Sprite.visible = true
		#3:
			#stage3Sprite.visible = true
		#_:
			#stage0Sprite.visible = true

func onInventoryUpdate(itemType: ResourceManager.ItemTypes, amount: int):
	updateSprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
