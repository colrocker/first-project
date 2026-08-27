extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var doublejump = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	if not is_on_floor() and Input.is_action_just_pressed("ui_accept") and doublejump == true:
		velocity.y = JUMP_VELOCITY
		doublejump = false
	elif is_on_floor():
		doublejump = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"):
		body.collision_layer = 1
		body.collision_mask = 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"):
		body.collision_layer = 2
		body.collision_mask = 2
