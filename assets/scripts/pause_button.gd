# TextureButton.gd with enhanced press effects
extends TextureButton

# Enhanced press effect settings
@export var press_offset = Vector2(3, 3)  # Increased for more visible effect
@export var press_darkness = 0.65  # More darkening (0-1, lower is darker)
@export var press_scale = 0.95  # Slight scaling effect
@export var window_scene_path: String

# Original state properties
var original_color = Color.WHITE
var original_scale = Vector2.ONE

func _ready():
	# Fix: Connect to the correct signals
	# button_down = when mouse presses down
	# button_up = when mouse releases
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	
	# Store original values
	original_color = modulate
	original_scale = scale
	
func _on_button_down():
	# Apply the enhanced "pressed" effect
	position += press_offset
	modulate = Color(press_darkness, press_darkness, press_darkness, 1.0)
	scale = original_scale * press_scale  # Slightly smaller
	
func _on_button_up():
	# Restore normal appearance
	position -= press_offset
	modulate = original_color
	scale = original_scale
	
	# Open window when released (if path specified)
	if window_scene_path and window_scene_path.length() > 0:
		WindowManager.open_window(window_scene_path)
