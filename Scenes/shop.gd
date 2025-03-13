extends Control

#Create button
@onready var iridium_button = $PanelContainer/VBoxContainer/Iridium
@onready var bronze_button = $PanelContainer/VBoxContainer/Bronze
@onready var tungsten_button = $PanelContainer/VBoxContainer/Tungsten
@onready var peridot_button = $PanelContainer/VBoxContainer/Peridot
@onready var nickel_button = $PanelContainer/VBoxContainer/Nickel
@onready var exit_button = $Button
#Text box
@onready var dialgoue_box = $PanelContainer2/RichTextLabel 

var default_text: String = "[center]I can upgrade your ore into super ore in order to build the space station.[/center]"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create button's listeners
	
	iridium_button.button_down.connect(on_iri_press)
	bronze_button.button_down.connect(on_bron_press)
	tungsten_button.button_down.connect(on_tung_press)
	peridot_button.button_down.connect(on_peri_press)
	nickel_button.button_down.connect(on_ni_press)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Button event functions
func on_iri_press():
	print("pressed iridium button")
	dialgoue_box.text="[center]Thanks! Here's your iridium!"	
	
func on_bron_press():
	print("pressed bronze button")
	dialgoue_box.text="[center]Thanks! Here's your bronze!"

func on_tung_press():
	print("pressed tungsten button")
	dialgoue_box.text="[center]Thanks! Here's your tungsten!"
	
func on_peri_press():
	print("pressed peridot button")
	dialgoue_box="[center]Thanks! Here's your peridot!"
	
func on_ni_press():
	print("pressed nickel button")
	dialgoue_box="[center]Thanks! Here's your nickel!"
	
