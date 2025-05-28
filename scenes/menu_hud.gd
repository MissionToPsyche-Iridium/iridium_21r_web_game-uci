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

	$Main/MenuPanel/LeftCol/Characters.pressed.connect(_on_characters_button_pressed)
	$Main/MenuPanel/LeftCol/Lab.pressed.connect(_on_lab_button_pressed)
	$Main/MenuPanel/LeftCol/Story.pressed.connect(_on_story_button_pressed)
	$Main/MenuPanel/LeftCol/About.pressed.connect(_on_about_button_pressed)

	$Main/MenuPanel/RightCol/Pause.pressed.connect(_on_pause_button_pressed)
	$Main/MenuPanel/RightCol/Settings.pressed.connect(_on_settings_button_pressed)
	$Main/MenuPanel/RightCol/Map.pressed.connect(_on_map_button_pressed)
	$Main/MenuPanel/RightCol/Credits.pressed.connect(_on_credits_button_pressed)

func _toggle_menu():
	menu_panel.visible = !menu_panel.visible

func _on_characters_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Characters/CharactersWindow.tscn")

func _on_lab_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Lab/LabWindow.tscn")

func _on_story_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Story/StoryWindow.tscn")

func _on_about_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/AboutPsyche/AboutPsycheWindow.tscn")

func _on_pause_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Pause/PauseWindow.tscn")

func _on_settings_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Settings/SettingsWindow.tscn")

func _on_map_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Map/MapWindow.tscn")

func _on_credits_button_pressed():
	WindowManager.open_window("res://assets/menu/windows/Credits/CreditsWindow.tscn")
