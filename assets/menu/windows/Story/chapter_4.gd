extends Button

var new_texture = preload("res://assets/menu/windows/Story/Chapter4.png")

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var parent_texture_rect = get_parent()
	parent_texture_rect.texture = new_texture
