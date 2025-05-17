extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "ruler"
var factoid = "The Pysche asteroid is estimated to have a surface area of about 64,000 square miles."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_ruler = true
	self.visible = false
	print("get interacted rulerr")
