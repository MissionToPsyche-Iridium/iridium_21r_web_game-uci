class_name StartScene extends Node2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var startMenu: StartMenu = $CanvasLayer/StartMenu
@onready var musicPlayer: AudioStreamPlayer = $AudioStreamPlayer
@export var introMusicIntro: AudioStreamMP3
@export var introMusicLoop: AudioStreamMP3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startMenu.on_start_pressed.connect(on_start)
	Dialogic.start("opening_cutscene")
	#Dialogic.end_timeline()
	#Dialogic.start("arrival_at_psyche")
	#Dialogic.end_timeline()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_start() -> void:
	GameManager.instance.begin_transition("res://scenes/base.tscn", Vector2.ZERO, false)
	Dialogic.start("arrival_at_psyche")

func start_intro() -> void:
	animationPlayer.play("intro")
	play_music_intro()

func play_music_intro() -> void:
	musicPlayer.stream = introMusicIntro
	musicPlayer.finished.connect(play_music_loop)
	musicPlayer.play()

func play_music_loop() -> void:
	musicPlayer.stream = introMusicLoop
	musicPlayer.play()
