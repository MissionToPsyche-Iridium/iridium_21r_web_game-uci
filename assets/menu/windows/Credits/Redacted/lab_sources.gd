extends Button

# Preload the texture for switching to
var new_texture = preload("res://assets/menu/windows/Credits/LabSources.png")

func _ready():
	# Connect the pressed signal to our function
	$".".pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Get the parent TextureRect
	var parent_texture_rect = get_parent()
	
	# Verify parent is TextureRect
	if parent_texture_rect is TextureRect:
		# Change the texture
		parent_texture_rect.texture = new_texture
