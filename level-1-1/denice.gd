extends CharacterBody2D

@onready var win_area = $WinArea

func _on_win_area_body_entered(body: Node2D):
	# 🚨 DIAGNOSTIC: This will print the name of absolutely anything entering her zone!
	print("Denice's WinArea was physically touched by: ", body.name)
	
	if body.name.to_lower() == "gordy" or body.is_in_group("Player"):
		if GlobalGame.heart_count >= 10:
			print("VICTORY CONDITIONS MET!")
			trigger_win_sequence(body)
		else:
			var remaining = 10 - GlobalGame.heart_count
			print("Denice: Go fetch ", remaining, " more hearts!")

func trigger_win_sequence(player: Node2D):
	# 1. Freeze Gordy's movement controls so he can't run off-screen
	player.set_physics_process(false)
	
	# 2. Add an optional victory pause delay
	await get_tree().create_timer(2.0).timeout
	
	# 3. Reset the global heart tally for the next playthrough
	GlobalGame.heart_count = 0
	
	# 4. Restart or load a victory scene! For now, we will reload the level clean
	get_tree().reload_current_scene()
