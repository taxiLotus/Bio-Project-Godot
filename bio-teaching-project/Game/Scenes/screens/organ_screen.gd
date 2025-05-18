extends Control

var organ

func _enter_tree():
	VocabList.current_vocab.clear()
	
	if Global.current_organ == "full_system":
		VocabList.current_vocab.append("Vein")
		VocabList.current_vocab.append("Artery")
		VocabList.current_vocab.append("Capillary")
		VocabList.current_vocab.append("Ventricle")
		VocabList.current_vocab.append("Atrium")
		VocabList.current_vocab.append("Lung")
		organ = preload("res://Game/Types/full_system.tscn")
		
	if Global.current_organ == "fish_system":
		VocabList.current_vocab.append("Vein")
		VocabList.current_vocab.append("Artery")
		VocabList.current_vocab.append("Capillary")
		VocabList.current_vocab.append("Ventricle")
		VocabList.current_vocab.append("Atrium")
		organ = preload("res://game/Types/fish_system.tscn")
		
	if Global.current_organ == "lungs":
		VocabList.current_vocab.append("Larynx")
		VocabList.current_vocab.append("Trachea")
		VocabList.current_vocab.append("Bronchus")
		VocabList.current_vocab.append("Bronchiole")
		VocabList.current_vocab.append("Alveoli")
		organ = preload("res://game/Types/lungs.tscn")
	
	VocabList.current_vocab.sort()
	var instance = organ.instantiate()
	add_child(instance)
	move_child(instance, 0)
		
func _ready():
	var rect1 = ColorRect.new()
	add_child(rect1)
	rect1.color = "e37262"
	rect1.size = Vector2(1152, 16)
	rect1.position = Vector2(0, 632)
	
	var rect2 = ColorRect.new()
	add_child(rect2)
	rect2.color = "e37262"
	rect2.size = Vector2(16, 648)
	rect2.position = Vector2(1136, 0)
	
	var rect3 = ColorRect.new()
	add_child(rect3)
	rect3.color = "e37262"
	rect3.size = Vector2(16, 648)
	rect3.position = Vector2(0, 0)
	
	var rect4= ColorRect.new()
	add_child(rect4)
	rect4.color = "e37262"
	rect4.size = Vector2(1152, 16)
	rect4.position = Vector2(0, 0)
