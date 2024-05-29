extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -400.0

var Jump_Avalible: bool = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2

@onready var animated_sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer


func _physics_process(delta):
	if not is_on_floor():
		# Add the gravity.
		velocity.y += gravity * delta
		
		if coyote_timer.is_stopped() and jump_count == 0:
			coyote_timer.start(0.2)
		
	else:
		coyote_timer.stop()
		jump_count = 0
		Jump_Avalible = true


	# Handle jump.
	if Input.is_action_just_pressed("Jump") and Jump_Avalible and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move_left", "Move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coyote_timer_timeout():
	Jump_Avalible = false
	pass # Replace with function body.
