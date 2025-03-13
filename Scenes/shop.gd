extends Control

#Create button
@onready var iridium_button = $PanelContainer/VBoxContainer/Iridium
@onready var bronze_button = $PanelContainer/VBoxContainer/Bronze
@onready var tungsten_button = $PanelContainer/VBoxContainer/Tungsten
@onready var peridot_button = $PanelContainer/VBoxContainer/Peridot
@onready var nickel_button = $PanelContainer/VBoxContainer/Nickel
@onready var exit_button = $Button
#Text box
@onready var dialogue_box = $PanelContainer2/RichTextLabel

var purchase_delay: float = 1.0
var _purchase_timer: float = 0.0
var purchased: bool = false

var default_text: String = "[center]I can upgrade your ore into super ore in order to build the space station.[/center]"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create button's listeners
	_purchase_timer = 0
	purchased = false
	iridium_button.button_down.connect(on_iri_press)
	bronze_button.button_down.connect(on_bron_press)
	tungsten_button.button_down.connect(on_tung_press)
	peridot_button.button_down.connect(on_peri_press)
	nickel_button.button_down.connect(on_ni_press)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (purchased):
		_purchase_timer += delta
		if _purchase_timer > purchase_delay:
			anything_else_popup()
	
func anything_else_popup():
	dialogue_box.text="[center]Anything else I can get for you?[/center]"
	purchased = false

func on_purchase():
	purchased = true
	_purchase_timer = 0
	

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
	
