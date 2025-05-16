class_name BGMManager extends Node

static var instance: BGMManager = null

@onready var audioPlayer: AudioStreamPlayer = $AudioStreamPlayer
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
var queuedIntro: AudioStream = null
var queuedIntroLength: float = 0
var queuedTrack: AudioStream = null

var trackAfterIntro: AudioStream = null
var introPlaying: bool = false
var introLength: float = 0
var introTime: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if instance != null:
		instance.queue_free()
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (introPlaying):
		introTime += delta
		if introTime >= introLength:
			play_track(trackAfterIntro)
			trackAfterIntro = null
			introPlaying = false
			introLength = 0

func fade_out() -> void:
	animationPlayer.play("fade_out")

func on_finish_fade_out() -> void:
	audioPlayer.stop()
	if queuedTrack != null:
		play_track(queuedTrack, queuedIntro, queuedIntroLength)
		queuedTrack = null
		queuedIntro = null
		queuedIntroLength = 0

func play_track(track: AudioStream, intro: AudioStream = null, introLength: float = 0) -> void:
	audioPlayer.volume_db = 0
	if intro:
		audioPlayer.stream = intro
		introPlaying = true
		self.introLength = introLength
		introTime = 0
		trackAfterIntro = track
	else:
		audioPlayer.stream = track
		trackAfterIntro = null
		introPlaying = false
		introTime = 0
		self.introLength = 0
	audioPlayer.play()
	

func queue_track(track: AudioStream, intro: AudioStream = null, introLength: float = 0) -> void:
	if track == audioPlayer.stream:
		print("same track")
		return
	if audioPlayer.playing:
		if !animationPlayer.is_playing():
			fade_out()
		queuedTrack = track
		queuedIntro = intro
		queuedIntroLength = introLength
	else:
		play_track(track, intro, introLength)
