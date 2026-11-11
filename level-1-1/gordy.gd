extends CharacterBody2D

# Authentic Mario physics tuning values
const SPEED = 150.0
const JUMP_VELOCITY = -350.0
const MIN_JUMP_VELOCITY = -120.0 # For short hops

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var camera = $Camera2D

func _physics_process(delta):
	# Apply Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Variable Jump Height (Hold button for high jump, release for short hop)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("ui_accept") and velocity.y < MIN_JUMP_VELOCITY:
		velocity.y = MIN_JUMP_VELOCITY

	# Horizontal Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# Retro Constraint: Prevent Gordy from walking off the left side of the camera view
	if camera:
		var camera_left_edge = camera.get_screen_center_position().x - (get_viewport_rect().size.x / (2 * camera.zoom.x))
		if global_position.x < camera_left_edge + 8: # 8 pixels padding
			global_position.x = camera_left_edge + 8

# Triggered by the Goomba when a collision happens
func die():
	print("Gordy Died! Reloading level...")
	
	# Freeze movement and disable physics loop processing
	set_physics_process(false) 
	
	# Wait 1 second before reloading the map layout
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://end_screen.tscn")
