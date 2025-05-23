class_name Ore extends Node2D

enum OreType { COPPER, NICKEL, SILVER, TUNGSTEN, IRIDIUM }
const REQUIRED_PICKAXE_TIERS = [0, 0, 1, 1, 2]
const ORE_NAMES = ["Cu", "Ni", "Ag", "W", "Ir"]

@export var ore_type: OreType = OreType.COPPER
@export var ore_amount: int = 1
@export var hp: int = 50

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
@onready var damageText = $DamageNumber
var requiredPickaxeTier: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame = ore_type as int
	requiredPickaxeTier = REQUIRED_PICKAXE_TIERS[ore_type]

func update_sprite() -> void:
	sprite.frame = ore_type as int
	requiredPickaxeTier = REQUIRED_PICKAXE_TIERS[ore_type]

func on_hit(dmg: int) -> void:
	animationPlayer.stop()
	if SFXManager.instance:
		SFXManager.instance.play_sfx("swing", 0.1)
	if ResourceManager.instance.pickaxeTier >= requiredPickaxeTier:
		damageText.text = "%s" % dmg
		animationPlayer.play("hit")
		
		hp -= dmg
		if hp <= 0:
			perish()
		elif SFXManager.instance:
			SFXManager.instance.play_sfx("hit_ore", 0.1)
	else:
		damageText.text = "0"
		animationPlayer.play("hit_no")
		if !CutsceneManager.instance.tried_to_mine_a_harder_ore:
			CutsceneManager.instance.start_cutscene("try_to_mine_harder_ore")
			CutsceneManager.instance.tried_to_mine_a_harder_ore = true
	if !CutsceneManager.instance.has_mined:
		CutsceneManager.instance.start_cutscene("first_time_mining")
		CutsceneManager.instance.has_mined = true
	#dmgInstance.animation_finished.connect(dmgInstance.queue_free)
		

func perish() -> void:
	ResourceManager.instance.add_to_inventory(toItemType(), ore_amount)

	if GameManager.instance != null:
		ObjectiveManager.instance.on_ore_mined(ore_type)
	damageText.text = "x%s %s" % [ore_amount, ORE_NAMES[ore_type]]
	animationPlayer.play("perish")
	if SFXManager.instance:
			SFXManager.instance.play_sfx("break_ore", 0.1)

func toItemType() -> ResourceManager.ItemTypes:
	match ore_type:
		OreType.COPPER:
			return ResourceManager.ItemTypes.COPPER_ORE
		OreType.NICKEL:
			return ResourceManager.ItemTypes.NICKEL_ORE
		OreType.SILVER:
			return ResourceManager.ItemTypes.SILVER_ORE
		OreType.TUNGSTEN:
			return ResourceManager.ItemTypes.TUNGSTEN_ORE
		OreType.IRIDIUM:
			return ResourceManager.ItemTypes.IRIDIUM_ORE
		_:
			return ResourceManager.ItemTypes.COPPER_ORE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
