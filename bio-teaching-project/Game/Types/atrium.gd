extends TextureButton

func _on_mouse_entered() -> void:
	OrganBus.mouse_entered.emit()
	
func _on_mouse_exited() -> void:
	OrganBus.mouse_exited.emit()

func _on_focus_entered() -> void:
	OrganBus.focus_entered.emit()

func _on_focus_exited() -> void:
	OrganBus.focus_exited.emit()

func _on_pressed() -> void:
	OrganBus.pressed.emit()

var all_vocab_words

func _ready() -> void:
	var vocab_path = get_node("../../../").get_child(1).get_child(0).get_child(0).get_path()
	all_vocab_words = get_all_children(vocab_path)
	connect_signals()

func connect_signals():
	var check_words : int = 0
	while check_words < all_vocab_words.size():
		var word = all_vocab_words[check_words]
		word.connect("mouse_entered", _on_word_entered.bind(word.name))
		word.connect("mouse_exited", _on_word_exited.bind(word.name))
		check_words += 1
		
func get_all_children(in_node_path: NodePath, arr := []):
	var in_node = get_node(in_node_path)
	arr.push_back(in_node)
	for child in in_node.get_children():
		var child_path = child.get_path()
		arr = get_all_children(child_path, arr)
	return arr
	
func _on_word_entered():
	OrganBus.mouse_entered.emit()

func _on_word_exited():
	pass
