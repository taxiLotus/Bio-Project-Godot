extends Node

var current_scene = null

func _ready():
	var root = get_tree().root.get_child(-1)
	current_scene = root.get_child(-1).get_child(-1)
	
func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)
	
func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.get_child(-1).get_child(-1).add_child(current_scene)
