extends Button

var vocab_word: String
var defOpen := false
var all_organ_parts

func _ready() -> void:
	var organ_path = get_node("../../../").get_child(0).get_child(0).get_path()
	all_organ_parts = get_all_children(organ_path)
	connect_signals()
	alignment = HORIZONTAL_ALIGNMENT_CENTER
	self.connect("mouse_entered", _on_mouse_entered)
	self.connect("mouse_exited", _on_mouse_exited)
	self.connect("pressed", _on_pressed)

func connect_signals():
	var check_organs : int = 0
	while check_organs < all_organ_parts.size():
		var organ = all_organ_parts[check_organs]
		organ.connect("pressed", _on_organ_pressed.bind(organ.name))
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
	text = "" + vocab_word
	
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
		
	OrganBus.pressed.emit()
	
func _on_organ_pressed(organ_name):
	if defOpen == true:
		description.queue_free()
		defOpen = false
		
	if organ_name == vocab_word:
		description = Label.new()
		description.autowrap_mode = 3
		var node_index = get_index()
		get_parent().add_child(description)
		description.text = "    " + VocabList.vocab[vocab_word]
		get_parent().move_child(description, node_index+1)
		defOpen = true

func _on_mouse_entered():
	OrganBus.mouse_entered.emit()
	for organ in all_organ_parts:
		if organ.name == vocab_word:
			organ.set_texture_normal(organ.get_texture_hover())

func _on_mouse_exited():
	OrganBus.mouse_exited.emit()
	for organ in all_organ_parts:
		if organ.name == vocab_word:
			organ.set_texture_normal(null)
