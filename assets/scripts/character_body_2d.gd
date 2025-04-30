class_name Player extends CharacterBody2D

enum States {IDLE, MOVING, MINING, MINING_PREP}

#class_name Player 

@export var SPEED = 600.0
const JUMP_VELOCITY = -400.0

@onready var _animation_player = $AnimationPlayer
@onready var _mining_qte_controller = $MiningQTEController
@onready var _hitbox_controller = $HitboxController

#@onready var _text_label = $Container/RichTextLabel

var state = States.IDLE
var actionable = true

func _ready() -> void:
	_animation_player.play('idle_down')

func _physics_process(_delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if (actionable):
		move_player()
	else:
		velocity = Vector2.ZERO
	move_and_slide()


func move_player() -> void:
	var y_input := Input.get_axis("ui_up", "ui_down")
	var x_input := Input.get_axis("ui_left", "ui_right")
	var factor = sqrt(y_input**2 + x_input**2) # Normalize diagonal movement
	var y_direction = 0.0 if factor == 0 else y_input / factor
	var x_direction = 0.0 if factor == 0 else x_input / factor
	
	match state:
		States.IDLE:
			if (y_direction || x_direction):
				set_state(States.MOVING)
		States.MOVING:
			if y_direction:
				velocity.y = y_direction * SPEED
				if (abs(y_direction) > abs(x_direction)):
					if (y_direction < 0):
						_animation_player.play("move_up")
					else:
						_animation_player.play("move_down")
			else:
				velocity.y = move_toward(velocity.y, 0, SPEED)
				
			if x_direction:
				velocity.x = x_direction * SPEED
				if (abs(x_direction) >= abs(y_direction)):
					if (x_direction < 0):
						_animation_player.play("move_left")
					else:
						_animation_player.play("move_right")
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			if (!y_direction && !x_direction):
				set_state(States.IDLE)
		States.MINING:
			pass
	#
	#if (!y_direction && !x_direction):
		#match (_animated_sprite.animation):
			#"move_left":
				#_animated_sprite.play("idle_left")
			#"move_right":
				#_animated_sprite.play("idle_right")
			#"move_up":
				#_animated_sprite.play("idle_up")
			#"move_down":
				#_animated_sprite.play("idle_down")

	

func _input(event) -> void:
	if (actionable):
		if event.is_action_pressed("ui_accept"):
			begin_mine()
		if event.is_action_released("ui_accept"):
			end_mine()

func begin_mine() -> void:
	match state:
		States.IDLE, States.MOVING:
			set_state(States.MINING_PREP)
			_mining_qte_controller.start_qte()
			match _animation_player.current_animation:
				"move_left", "idle_left":
					_animation_player.play("mine_prep_left")
				"move_right", "idle_right":
					_animation_player.play("mine_prep_right")
				"move_up", "idle_up":
					_animation_player.play("mine_prep_up")
				"move_down", "idle_down":
					_animation_player.play("mine_prep_down")
				_:
					_animation_player.play("mine_prep_down")

func end_mine() -> void:
	if state == States.MINING_PREP:
		set_state(States.MINING)
		var score = _mining_qte_controller.swing_pickaxe()
		_hitbox_controller.dmg_to_do = _calculate_mining_damage(score)
		#_hitbox_controller.set_damage(ceil(score * 10) as int)
		match _animation_player.current_animation:
			"mine_prep_left":
				_animation_player.play("mine_left")
			"mine_prep_right":
				_animation_player.play("mine_right")
			"mine_prep_up":
				_animation_player.play("mine_up")
			"mine_prep_down":
				_animation_player.play("mine_down")
			_:
				_animation_player.play("mine_down")

func set_state(new_state: int) -> void:
	match new_state:
		States.IDLE:
			state = new_state as States
			#_text_label.text = "IDLE"
			match (_animation_player.current_animation):
				"move_left", "mine_left":
					_animation_player.play("idle_left")
				"move_right", "mine_right":
					_animation_player.play("idle_right")
				"move_up", "mine_up":
					_animation_player.play("idle_up")
				"move_down", "mine_down":
					_animation_player.play("idle_down")
				_:
					_animation_player.play("idle_down")
		States.MOVING:
			state = new_state as States
			#_text_label.text = "MOVING"
		States.MINING:
			state = new_state as States
			#_text_label.text = "MINING"
			velocity.y = 0
			velocity.x = 0
		States.MINING_PREP:
			state = new_state as States
			velocity.y = 0
			velocity.x = 0

func _calculate_mining_damage(score: float) -> int:
	return ceil(pow(score, 2) * 10) + 10
