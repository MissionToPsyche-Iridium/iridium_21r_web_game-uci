extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "atom"
var factoid = "The Pysche spacecraft thrusters work by expelling charged atoms, or ions, of xenon, emitting a brilliant blue glow that trails behind the spacecraft."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_atom = true
	self.visible = false
	print("get interacted atom")
