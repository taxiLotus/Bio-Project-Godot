extends HBoxContainer

func _ready() -> void:
	for screen in Global.available_screens:
		var screen_scene = preload("res://game/types/nav_button.tscn")
		var instance = screen_scene.instantiate()
		add_child(instance)
		instance.setup(screen)
