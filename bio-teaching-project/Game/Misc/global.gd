extends Node

var out = false

var current_scene = null
var current_organ = null
var current_organ_title

var icons = {
	"back" : "res://sprites/undo.png",
	"full_system" : "res://sprites/full_system.png",
	"fish_system" : "res://sprites/fish_system.png",
	"lungs" : "res://sprites/lungs_full.png",
	"bronchioles" : "res://sprites/bronchiole_closeup.png",
	"alveoli" : "res://sprites/alveoli_still.png"
}
var titles = {
	"back" : "",
	"full_system" : "Double Circulation (Mammalian)",
	"fish_system" : "Single Circulation (Fish)",
	"lungs" : "Lungs",
	"bronchioles" : "Bronchiole Closeup",
	"alveoli" : "Alveoli Closeup"
}

var available_screens = ["full_system", "fish_system", "lungs", "bronchioles", "alveoli"]
var back_history = []

func sort_by_title(a, b):
	if(titles[a] < titles[b]):
		return true
	return false

func handle_switch(organ):
	if current_organ != null:
		available_screens.append(current_organ)
		if organ != "back":
			back_history.append(current_organ)
	available_screens.sort_custom(sort_by_title)
	
	if back_history.size() > 0 and available_screens[0] != "back":
		available_screens.insert(0, "back")
	
	current_organ = organ
	if current_organ == "back":
		current_organ = back_history.pop_back()
		if back_history.size() == 0:
			available_screens.erase("back")
	goto_scene("res://game/scenes/screens/organ_screen.tscn")
	available_screens.erase(current_organ)
	current_organ_title = titles[current_organ]

func _ready():
	var root = get_tree().root.get_child(-1)
	current_scene = root.get_child(-1).get_child(-1)
	
func goto_scene(path):
	path = path.to_lower()
	_deferred_goto_scene.call_deferred(path)
	
var s
func _deferred_goto_scene(path):
	current_scene.free()
	var t = path.to_lower()
	var s = ResourceLoader.load(t)
	current_scene = s.instantiate()
	get_tree().root.get_child(-1).get_child(-1).add_child(current_scene)
