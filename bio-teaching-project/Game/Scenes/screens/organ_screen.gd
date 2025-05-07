extends Control

var current_organ = "full_system"

func _enter_tree():
	if current_organ == "full_system":
		VocabList.current_vocab.append("Vein")
		VocabList.current_vocab.append("Artery")
		VocabList.current_vocab.append("Capillary")
		VocabList.current_vocab.append("Ventricle")
		VocabList.current_vocab.append("Lung")

	VocabList.current_vocab.sort()
