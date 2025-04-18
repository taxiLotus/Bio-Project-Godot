extends Control

func _on_start_button_pressed() -> void:
	Global.goto_scene("res://game/scenes/screens/organ_screen.tscn")
	
	VocabList.current_vocab.append("Aorta")
	VocabList.current_vocab.append("Vein")
