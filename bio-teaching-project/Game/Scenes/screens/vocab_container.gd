extends VBoxContainer

func _ready():
	for word in VocabList.current_vocab:
		var vocab_scene = preload("res://game/Types/vocab_word.tscn")
		var instance = vocab_scene.instantiate()
		add_child(instance)
		instance.set_word(word)
