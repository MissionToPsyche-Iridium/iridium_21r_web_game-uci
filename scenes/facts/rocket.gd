extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "rocket"
var factoid = "The Pysche asteriod appears to be the exposed nickel-iron core of an early planet."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_rocket = true
	self.visible = false
	print("get interacted rocket style")
	#print(factoid)
