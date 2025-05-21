class_name SFXManager extends Node

static var instance: SFXManager = null

const audioStreams: Dictionary = {
	"buy_fail": [preload("res://assets/audio/sfx/buy_fail.mp3")],
	"buy": [preload("res://assets/audio/sfx/buy.wav")],
	"swing": [preload("res://assets/audio/sfx/swing1.wav"),preload("res://assets/audio/sfx/swing2.wav")],
	"hit_ore": [preload("res://assets/audio/sfx/smash1.mp3"),preload("res://assets/audio/sfx/smash2.wav"),preload("res://assets/audio/sfx/smash3.wav")],
	"break_ore": [preload("res://assets/audio/sfx/sm4sh.mp3")],
	"click": [preload("res://assets/audio/sfx/spaceyclick.mp3")],
	"footstep": [preload("res://assets/audio/sfx/footstep1.wav"),preload("res://assets/audio/sfx/footstep2.wav"),preload("res://assets/audio/sfx/footstep3.wav")]
}

@export var audioPlayers: Array[AudioStreamPlayer]
var audioPlayerIndex = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if instance != null:
		instance.queue_free()
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_sfx(name: String, pitch_variance: float = 0):
	if name in audioStreams:
		_play_audio(audioStreams[name][randi_range(0, len(audioStreams[name]) - 1)], randf_range(1-pitch_variance, 1+pitch_variance))

func _play_audio(audio: AudioStream, pitch: float = 1, volume: float = 0):
	var audioPlayer = audioPlayers[audioPlayerIndex]
	audioPlayerIndex = (audioPlayerIndex + 1) % len(audioPlayers)
	audioPlayer.stream = audio
	audioPlayer.pitch_scale = pitch
	audioPlayer.volume_db = volume
	audioPlayer.play()
