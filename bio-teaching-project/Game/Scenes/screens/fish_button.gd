extends Button

func _on_pressed() -> void:
	Global.current_organ = "fish_system"
	Global.goto_scene("res://game/scenes/screens/organ_screen.tscn")
