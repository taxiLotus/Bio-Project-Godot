extends Control



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/screens/after_start.tscn")
