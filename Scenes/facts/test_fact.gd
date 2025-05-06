extends Area2D

@onready var interactable: Area2D = $Interactable

var factoid = "this is a test fact."


#func _on_body_entered(body: Node2D) -> void:
#	if body is Player:
#		Global.has_test_fact = true
#		self.visible = false


func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_test_fact = true
	self.visible = false
	print("get interacted")
