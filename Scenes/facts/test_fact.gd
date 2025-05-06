extends Area2D

var factoid = "this is a test fact."


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.has_test_fact = true
		self.visible = false
