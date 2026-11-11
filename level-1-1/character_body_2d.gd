extends CharacterBody2D

const SPEED = -50.0 # Standard pacing velocity
var direction = Vector2.LEFT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Apply standard environment gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Reverse direction smoothly when walking into pipes or walls
	if is_on_wall():
		direction = -direction

	velocity.x = direction.x * SPEED
	move_and_slide()
	$Hitbox.monitoring = true
# Connected via the Node Tab from your Area2D Hitbox node
func _on_hitbox_body_entered(body: Node2D):
	print("HITBOX TOUCHED BY: ", body.name)
	
	# Checks for group tags, lowercase naming variants, or capitalized project names
	if body.is_in_group("Gordy") or body.name.to_lower() == "gordy" or body.name == "Gordy":
		print("Match identified! Defeating Gordy.")
		if body.has_method("die"):
			body.die()
