extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "radio"
var factoid = "After interfacing with the Psyche’s radio frequency transmitter, the laser communications demo sent a copy of engineering data from over 140 million miles (226 million kilometers) away."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_radio = true
	self.visible = false
	print("get interacted radio")
	#print(factoid)
