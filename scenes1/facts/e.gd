extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "e"
var factoid = "The Psyche mission is currently in “Phase E.” This phase of the mission encompasses cruise (including a Mars gravity assist), arrival at the asteroid, and orbiting the asteroid."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_e = true
	self.visible = false
	print("get interacted eeeeeeeee")
