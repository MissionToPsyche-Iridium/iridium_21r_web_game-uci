class_name Shop extends CanvasLayer

#@onready var Scene_transition_animation = $scene_transition1/transition_animation/AnimationPlayer

#Create button
@onready var iridium_button = $PanelContainer/VBoxContainer/Iridium
@onready var bronze_button = $PanelContainer/VBoxContainer/Bronze
@onready var tungsten_button = $PanelContainer/VBoxContainer/Tungsten
@onready var peridot_button = $PanelContainer/VBoxContainer/Peridot
@onready var nickel_button = $PanelContainer/VBoxContainer/Nickel
@onready var exit_button = $Button
#Text box
@onready var dialogue_box = $PanelContainer2/RichTextLabel

@export var exit_scene: String = "res://scenes/demo_indoor.tscn"
@export var exit_spawnPos: Vector2 = Vector2(588, 350)

var purchase_delay: float = 1.0
var _purchase_timer: float = 0.0
var purchased: bool = false

var default_text: String = "[center]I can upgrade your ore into super ore in order to build the space station.[/center]"

var exit_delay: float = 1.5
var _exit_timer: float = 0.0
var exit: bool = false

signal exited


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create button's listeners
	_purchase_timer = 0
	purchased = false
	exit = false
	iridium_button.button_down.connect(on_iri_press)
	bronze_button.button_down.connect(on_bron_press)
	tungsten_button.button_down.connect(on_tung_press)
	peridot_button.button_down.connect(on_peri_press)
	nickel_button.button_down.connect(on_ni_press)
	exit_button.button_down.connect(on_exit_press)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (purchased):
		_purchase_timer += delta
		if _purchase_timer > purchase_delay:
			anything_else_popup()
	if(exit):
		_exit_timer += delta
		if _exit_timer > exit_delay:
			leaving_popup()
			
		
func anything_else_popup():
	dialogue_box.text="[center]Anything else I can get for you?[/center]"
	purchased = false
	
func leaving_popup():
	dialogue_box.text=("[center]See you later![/center]")
	exit = true
	

func on_purchase():
	purchased = true
	_purchase_timer = 0
	
func on_exit():
	exit = true
	_exit_timer = 0	
	exited.emit()
# func on_leaving():
#	Scene_transition_animation.play("fade_in")
#	await get_tree().create_timer(.5).timeout
#	var scene_tree = get_tree()
#	scene_tree.change_scene_to_file("res://scenes/screen_1.tscn")

# Button event functions
func on_iri_press():
	print("pressed iridium button")
	dialogue_box.text="[center]Thanks! Here's your iridium![/center]"
	on_purchase()
	
func on_bron_press():
	print("pressed bronze button")
	dialogue_box.text="[center]Thanks! Here's your bronze![/center]"
	on_purchase()

func on_tung_press():
	print("pressed tungsten button")
	dialogue_box.text="[center]Thanks! Here's your tungsten![/center]"
	on_purchase()
	
func on_peri_press():
	print("pressed peridot button")
	dialogue_box.text="[center]Thanks! Here's your peridot![/center]"
	on_purchase()
	
func on_ni_press():
	print("pressed nickel button")
	dialogue_box.text="[center]Thanks! Here's your nickel![/center]"
	on_purchase()
	
func on_exit_press():
	print("exiting...")
	on_exit()
	
