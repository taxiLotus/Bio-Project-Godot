extends Control

var current_organ = "full_system"

func _enter_tree():
	if current_organ == "full_system":
		VocabList.current_vocab.append("Vein")
		VocabList.current_vocab.append("Artery")
		VocabList.current_vocab.append("Capillary")
		VocabList.current_vocab.append("Ventricle")
		VocabList.current_vocab.append("Lung")
		VocabList.current_vocab.append("Atrium")

	VocabList.current_vocab.sort()
	
	if current_organ == "full_system":
		var organ = preload("res://Game/Types/full_system.tscn")
		var instance = organ.instantiate()
		add_child(instance)
		move_child(instance, 0)
		
