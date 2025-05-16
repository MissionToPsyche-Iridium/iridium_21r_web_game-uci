extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "sun"
var factoid = "The Psyche spacecraft has an incredibly efficient propulsion system, which is powered by sunlight."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_sun = true
	self.visible = false
	print("get interacted sun")
