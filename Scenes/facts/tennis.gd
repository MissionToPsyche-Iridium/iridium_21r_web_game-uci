extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "tennis"
var factoid = "The Psyche spacecraft (including the solar panels) is about the size of a singles tennis court."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_tennis= true
	self.visible = false
	print("get interacted tennis ball")
	print(factoid)
