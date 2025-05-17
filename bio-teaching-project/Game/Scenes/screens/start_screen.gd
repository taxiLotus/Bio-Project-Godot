extends Control

func _on_texture_button_pressed() -> void:
	Global.goto_scene("res://game/scenes/screens/organ_screen.tscn")
	Global.current_organ = "full_system"
