extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "paper"
var factoid = "Pysche is only the 16th asteriod to be discovered!"

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_paper = true
	self.visible = false
	print("get interacted paper style")
