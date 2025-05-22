extends VBoxContainer

func _enter_tree() -> void:
	if get_child(0) != null:
		while get_child(0) != null:
			get_child(0).queue_free()

func _ready():
	for word in VocabList.current_vocab:
		var vocab_scene = preload("res://game/types/vocab_word.tscn")
		var instance = vocab_scene.instantiate()
		add_child(instance)
		instance.set_word(word)
