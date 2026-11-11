extends Control

@onready var result_label: Label = $EndLayout/ResultLabel

# Change this number to the maximum number of hearts available in your level
const TOTAL_HEARTS_NEEDED: int = 10 

func _ready() -> void:
	$EndLayout/TryAgainButton.pressed.connect(_on_try_again_pressed)
	determine_outcome()

func determine_outcome() -> void:
	# Checks your global autoload script to see if you collected enough hearts
	if GlobalGame.heart_count >= TOTAL_HEARTS_NEEDED:
		result_label.text = "YOU WIN!"
	else:
		result_label.text = "She left you..."

func _on_try_again_pressed() -> void:
	# Reset your global heart tracker back to zero before restarting
	GlobalGame.heart_count = 0
	# Replace with the exact path to your main level scene file
	get_tree().change_scene_to_file("res://Level1-1.tscn")
