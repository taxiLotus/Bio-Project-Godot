extends "res://game/types/ventricle.gd"

func _on_pressed() -> void:
	var vocab_scene = preload("res://game/types/infobox.tscn")
	var instance = vocab_scene.instantiate()
	add_child(instance)
	instance.position.x = 463
	instance.position.y = 257
	instance.set_word("bronchioles")
