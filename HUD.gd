extends CanvasLayer

@onready var player: CharacterBody2D = $".."
@onready var copper: Label = $Control/GridContainer/LabelCopper
@onready var tungsten: Label = $Control/GridContainer/LabelTungsten
@onready var irridium: Label = $Control/GridContainer/LabelIrridium
@onready var silver: Label = $Control/GridContainer/LabelSilver
@onready var peridot: Label = $Control/GridContainer/LabelPeridot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	copper.text = "x " + str(player.copperAmt)
	tungsten.text = "x " + str(player.tungstenAmt)
	irridium.text = "x " + str(player.irridiumAmt)
	silver.text = "x " + str(player.silverAmt)
	peridot.text = "x " + str(player.peridotAmt)
