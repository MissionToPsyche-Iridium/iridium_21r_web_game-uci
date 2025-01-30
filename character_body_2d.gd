extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


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
	var y_direction = 0 if factor == 0 else y_input / factor
	var x_direction = 0 if factor == 0 else x_input / factor
	
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	print(x_direction, y_direction)
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
