# TextureButton.gd (with window opening functionality)
extends TextureButton

# Position offset when pressed (in pixels)
var press_offset = Vector2(1, 1)
# Darkness factor when pressed (0-1, lower is darker)
var press_darkness = 0.8
# Original modulate color
var original_color = Color.WHITE
# Path to the window scene this button should open
@export var window_scene_path: String

func _ready():
	# Connect to button signals
	pressed.connect(_on_button_down)
	button_up.connect(_on_button_up)
	
	# Store original color
	original_color = modulate
	
func _on_button_down():
	# Apply the "pressed" effect
	position += press_offset
	modulate = Color(press_darkness, press_darkness, press_darkness, 1.0)
	
func _on_button_up():
	# Restore normal appearance
	position -= press_offset
	modulate = original_color
	
	# Open the window when button is released
	if window_scene_path != "":
		WindowManager.open_window(window_scene_path)
