extends CharacterBody2D


@export var SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
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
	
	if y_direction:
		velocity.y = y_direction * SPEED
		if (abs(y_direction) > abs(x_direction)):
			if (y_direction < 0):
				_animated_sprite.play("move_up")
			else:
				_animated_sprite.play("move_down")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	print(x_direction, y_direction)
	if x_direction:
		velocity.x = x_direction * SPEED
		if (abs(x_direction) >= abs(y_direction)):
			if (x_direction < 0):
				_animated_sprite.play("move_left")
			else:
				_animated_sprite.play("move_right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if (!y_direction && !x_direction):
		match (_animated_sprite.animation):
			"move_left":
				_animated_sprite.play("idle_left")
			"move_right":
				_animated_sprite.play("idle_right")
			"move_up":
				_animated_sprite.play("idle_up")
			"move_down":
				_animated_sprite.play("idle_down")

	move_and_slide()

func _update_anims(x_direction: float, y_direction: float) -> void:
	pass
