extends CanvasLayer

@onready var menu_button = $Main/MenuButton
@onready var menu_panel = $Main/MenuPanel
@onready var back_button = $Main/MenuPanel/Back

# Steps to add HUD to Scenes
# var hud_scene = preload("res://path_to/menu_hud.tscn")
# var hud_instance = null

# Add the below to func _ready():
#    hud_instance = hud_scene.instantiate()
#    add_child(hud_instance)

func _ready():
	# Hide menu initially
	menu_panel.visible = false
	
	# Connect menu button to toggle menu visibility
	menu_button.pressed.connect(_toggle_menu)
	back_button.pressed.connect(_toggle_menu)
	
	$Main/MenuPanel/RightCol/Pause.pressed.connect(_on_pause_button_pressed)
	# Connect all buttons in both columns
	#for button in $Control/MenuPanel/LeftCol.get_children():
		#if button is TextureButton:
			#button.pressed.connect(_on_menu_button_pressed.bind(button.name.replace("Button", "")))
	
	#for button in $Control/MenuPanel/RightCol.get_children():
		#if button is TextureButton:
			#button.pressed.connect(_on_menu_button_pressed.bind(button.name.replace("Button", "")))

func _toggle_menu():
	menu_panel.visible = !menu_panel.visible

	# Optional: If you need to restore focus to something in the HUD
	# $menuhud/some_control.grab_focus()
#func _on_menu_button_pressed(popup_type):
	#pass
	# Get corresponding popup
	#var popup_name = popup_type + "Popup"
	#var popup = $Control/Popups.get_node_or_null(popup_name)
	
	#if popup:
	#    popup.popup_centered()
	#    # Optionally hide the menu when a popup is opened
	#    menu_panel.visible = false

func _on_pause_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/PauseWindow.tscn")
