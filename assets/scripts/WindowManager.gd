# WindowManager.gd
extends Node

# A stack of open windows
var window_stack = []

# Open a window with optional parameters
func open_window(window_scene_path, params = null):
	# Instance the window scene
	var window_instance = load(window_scene_path).instantiate()
	
	# Set parameters if provided
	if params != null and window_instance.has_method("set_params"):
		window_instance.set_params(params)
	
	# Connect signals from the window
	window_instance.back_pressed.connect(_on_window_back_pressed.bind(window_instance))
	window_instance.close_all_pressed.connect(_on_window_close_all_pressed)
	
	# Add window to viewport and stack
	GameManager.instance.canvasLayer.add_child(window_instance)
	window_stack.push_back(window_instance)
	
	# Debug info
	print("Window opened: ", window_scene_path)
	print("Total windows: ", window_stack.size())

# Close the topmost window
func close_window():
	if window_stack.size() > 0:
		var window = window_stack.pop_back()
		window.queue_free()
		print("Window closed. Remaining: ", window_stack.size())

# Close all windows
func close_all_windows():
	for window in window_stack:
		window.queue_free()
	window_stack.clear()
	print("All windows closed")

# Handle back button pressed
func _on_window_back_pressed(window):
	# Find and remove the specific window that triggered the back button
	var index = window_stack.find(window)
	if index != -1:
		window_stack.remove_at(index)
		window.queue_free()
		print("Window removed via back button. Remaining: ", window_stack.size())
	else:
		# Fallback to closing the topmost window
		close_window()

# Handle close all button pressed
func _on_window_close_all_pressed():
	close_all_windows()
