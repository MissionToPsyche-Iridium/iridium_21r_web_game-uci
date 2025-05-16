extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "explosion"
var factoid = "The Pysche asteroid is most likely a survivor of multiple violent hit-and-run collisions, which was common when the solar system was forming."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_explosion = true
	self.visible = false
	print("get interacted explodeddd")
