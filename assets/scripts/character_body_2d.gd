extends CharacterBody2D

enum States {IDLE, MOVING, MINING}

@export var SPEED = 600.0
const JUMP_VELOCITY = -400.0

@onready var _animation_player = $AnimationPlayer

var state = States.IDLE

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

	move_and_slide()

func _input(event) -> void:
	if event.is_action_pressed("ui_accept"):
		mine()

func mine() -> void:
	match state:
		States.IDLE, States.MOVING:
			set_state(States.MINING)
			match _animation_player.current_animation:
				"move_left", "idle_left":
					_animation_player.play("mine_left")
				"move_right", "idle_right":
					_animation_player.play("mine_right")
				"move_up", "idle_up":
					_animation_player.play("mine_up")
				"move_down", "idle_down":
					_animation_player.play("mine_down")

func set_state(new_state: int) -> void:
	match new_state:
		States.IDLE:
			state = new_state as States
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
		States.MINING:
			state = new_state as States
			velocity.y = 0
			velocity.x = 0
