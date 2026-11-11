extends Area2D

# Optional: Add a signal if you want a global UI counter to know a coin was grabbed
signal heart_collected

func _on_body_entered(body: Node2D):
	# Double check that the object entering is actually the Player
	if body.is_in_group("Gordy") or body.name == "gordy":
		GlobalGame.add_heart()
		
		queue_free()
		# 1. Play coin sound effects or add score here if you have them
		print("Coin collected!")
		heart_collected.emit()
		
		# 2. Safely remove the coin from the level
		queue_free()
