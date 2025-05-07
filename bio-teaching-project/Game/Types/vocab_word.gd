extends Button

var vocab_word: String
var defOpen := false
var all_organ_parts

func _ready() -> void:
	all_organ_parts = get_all_children("../../../ClickableOrgan/Container")
	connect_signals()

func connect_signals():
	var check_organs : int = 0
	while check_organs < all_organ_parts.size():
		var organ = all_organ_parts[check_organs]
		organ.connect("pressed", _on_organ_pressed)
		check_organs += 1

func get_all_children(in_node_path: NodePath, arr := []):
	var in_node = get_node(in_node_path)
	arr.push_back(in_node)
	for child in in_node.get_children():
		var child_path = child.get_path()
		arr = get_all_children(child_path, arr)
	return arr

func set_word(word: String):
	vocab_word = word
	text = " " + vocab_word
	
var description = Label.new()

	
func _on_pressed() -> void:
	if defOpen == false:
		description = Label.new()
		description.autowrap_mode = 3
		var node_index = get_index()
		get_parent().add_child(description)
		description.text = "    " + VocabList.vocab[vocab_word]
		get_parent().move_child(description, node_index+1)
		defOpen = true
	else:
		description.queue_free()
		defOpen = false
	
func _on_organ_pressed():
	if defOpen == true:
		description.queue_free()
		defOpen = false
	
