extends Node

# This variable stays alive even when levels change or reset
var heart_count: int = 0

# A custom signal that tells our UI to update whenever a heart is grabbed
signal heart_total_changed(new_amount: int)

func add_heart():
	heart_count += 1
	heart_total_changed.emit(heart_count)
	print("Global hearts updated: ", heart_count)
