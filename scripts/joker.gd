extends CharacterBody2D

@onready var sprite = $AnimationPlayer

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("joker_jump")

	# Handle movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animation handling
	if not is_on_floor():
		sprite.play("joker_jump")
		print("Jumping")
	elif direction != 0:
		sprite.play("Joker_walk")  # if you have this animation
	else:
		sprite.play("joker_idle")

	move_and_slide()
