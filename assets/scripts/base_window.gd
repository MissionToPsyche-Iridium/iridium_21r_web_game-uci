# base_window.gd
extends Control

signal back_pressed
signal close_all_pressed

func _ready():
	print("BaseWindow initialized: ", name)
	
	# Find and connect buttons
	var close_button = find_button("CloseButton")
	if close_button:
		if not close_button.pressed.is_connected(_on_close_button_pressed):
			close_button.pressed.connect(_on_close_button_pressed)
		print("CloseButton connected")
	else:
		push_error("CloseButton not found in " + name)
	
	var back_button = find_button("BackButton")
	if back_button:
		if not back_button.pressed.is_connected(_on_back_button_pressed):
			back_button.pressed.connect(_on_back_button_pressed)
			print("BackButton connected")
	else:
		push_error("BackButton not found in " + name)

# Helper function to find buttons more thoroughly
func find_button(button_name):
	# Try direct child
	var button = get_node_or_null(button_name)
	if button != null:
		return button
		
	# Try searching deeper
	button = find_child(button_name, true, false)
	if button != null:
		return button
		
	return null

func _on_close_button_pressed():
	print("Close button pressed")
	emit_signal("close_all_pressed")
	
func _on_back_button_pressed():
	print("Back button pressed")
	emit_signal("back_pressed")
	
# Optional method for setting parameters
func set_params(params):
	pass  # Override in subclasses that need parameters
