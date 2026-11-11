extends CanvasLayer

@onready var heart_counter: Label = $LayoutContainer/HeartCounter

func _ready() -> void:
	# Update the text instantly when the game boots up
	update_heart_display()
	
	# Optional: If your Global script uses signals to announce when a heart is picked up, 
	# you can connect it here automatically. For example:
	# Global.heart_changed.connect(update_heart_display)

func _process(_delta: float) -> void:
	# Pull strategy fallback: If you aren't using signals, this ensures the UI 
	# constantly matches your global script variables every frame.
	update_heart_display()

func update_heart_display() -> void:
	heart_counter.text = "Hearts: " + str(GlobalGame.heart_count)
