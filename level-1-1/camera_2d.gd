extends Camera2D

var max_x: float = 0.0

func _ready():
	top_level = true # Detaches camera movement from player's instant repositioning
	max_x = global_position.x

func _process(_delta):
	# Track the player position
	var player_x = get_parent().global_position.x
	
	# Only update camera position if the player moves to the right
	if player_x > max_x:
		max_x = player_x
		
	# Lock the Y axis to standard level height, only move X forward
	global_position = Vector2(max_x, 0) 
