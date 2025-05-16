extends Area2D

@onready var interactable: Area2D = $Interactable

var facd_id = "monocle"
var factoid = "Psyche was found in 1852 by Italian astronomer Annibale de Gasparis, named it for the goddess of the soul in ancient Greek mythology."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_monocle = true
	self.visible = false
	print("get interacted hmm monocle")
