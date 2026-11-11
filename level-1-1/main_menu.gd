extends Control

func _ready() -> void:
	# This uses a direct node shortcut to bind your button safely
	$MenuLayout/Start.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed() -> void:
	# This pulls your entire level map and all its hearts back into your screen viewport!
	get_tree().change_scene_to_file("res://Level_1_1.tscn")
