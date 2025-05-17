extends Area2D

@onready var interactable: Area2D = $Interactable

var fact_id = "laser"
var factoid = "The Psyche mission will test a sophisticated new laser communication technology that encodes data in photons at near-infrared wavelengths (rather than radio waves) to communicate between a probe in deep space and Earth. Using light instead of radio allows the spacecraft to communicate more data in a given amount of time."

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	interactable.is_interactable = false
	Global.has_laser = true
	self.visible = false
	print("get interacted laser")
