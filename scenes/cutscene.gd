class_name Cutscene extends Node2D

@onready var camera_target: Node2D = $CameraTarget
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@export var bgm: AudioStreamMP3 = null
@export var bgmIntro: AudioStreamMP3 = null
@export var bgmIntroLength: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if BGMManager.instance and bgm != null:
		BGMManager.instance.queue_track(bgm, bgmIntro, bgmIntroLength)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade_in() -> void:
	GameManager.instance.Scene_transition_animation.play("fade_out")

func play_animation(name: String) -> void:
	animationPlayer.play(name)
