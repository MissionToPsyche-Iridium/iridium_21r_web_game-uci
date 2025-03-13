extends Area2D

@onready var shop: Shop = $Shop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	shop.visible = false
	shop.exited.connect(_on_exit)
	self.body_entered.connect(_on_enter)

func _on_enter(_body: Node2D) -> void:
	shop.visible = true
	GameManager.instance.set_player_actionable(false)

func _on_exit() -> void:
	shop.visible = false
	GameManager.instance.set_player_actionable(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
