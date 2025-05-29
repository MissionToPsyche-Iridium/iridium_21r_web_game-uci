class_name StartScene extends Node2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var startMenu: StartMenu = $CanvasLayer/StartMenu
@onready var musicPlayer: AudioStreamPlayer = $AudioStreamPlayer
@onready var menuAnimationPlayer: AnimationPlayer = $CanvasLayer/AnimationPlayer
@export var introMusicIntro: AudioStreamMP3
@export var introMusicLoop: AudioStreamMP3
@export var introMusicLength: float = 19.2
var menu_visible: bool = false
var is_playing = false

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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dialogic_default_action"):
		if is_playing and !menu_visible:
			startMenu.modulate.a = 1
			menu_visible = true
	#if !menu_visible:
		#startMenu.modulate.a = 1
		#menu_visible = true

func fade_in_menu() -> void:
	if !menu_visible:
		menuAnimationPlayer.play("fade_in")
		menu_visible = true

func on_start() -> void:
	GameManager.instance.begin_transition("res://scenes/base.tscn", Vector2(0, 300), false)
	Dialogic.start("arrival_at_psyche")

func start_intro() -> void:
	animationPlayer.play("intro")
	is_playing = true
	if BGMManager.instance:
		BGMManager.instance.play_track(introMusicLoop, introMusicIntro, introMusicLength)

func play_music_intro() -> void:
	musicPlayer.stream = introMusicIntro
	musicPlayer.finished.connect(play_music_loop)
	musicPlayer.play()

func play_music_loop() -> void:
	musicPlayer.stream = introMusicLoop
	musicPlayer.play()
