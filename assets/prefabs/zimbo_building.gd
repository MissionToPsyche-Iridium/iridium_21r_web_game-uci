extends Node2D

@export var transition_trigger: Area2D
@onready var tileMap: TileMapLayer = $TileMaps/TileMap
@onready var tileMapTop: TileMapLayer = $TileMaps/TileMapTop
@onready var transition: CollisionShape2D = $ZimboTransition/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateBuilding()

# deletes itself if player hasn't met zimbo yet
func updateBuilding() -> void:
	if !Dialogic.VAR.has_met_zimbo:
		queue_free()
	#else:
		#tileMap.visible = Dialogic.VAR.has_met_zimbo 
		#tileMapTop.visible = Dialogic.VAR.has_met_zimbo
		#transition.disabled = !Dialogic.VAR.has_met_zimbo
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
