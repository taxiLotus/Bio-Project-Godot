extends Button

var vocab_word: String
var defOpen := false



func set_word(word: String):
	vocab_word = word
	text = " " + vocab_word
	
var description = Label.new()

	
func _on_pressed() -> void:
	if defOpen == false:
		description = Label.new()
		var node_index = get_index()
		get_parent().add_child(description)
		description.text = "    " + VocabList.vocab[vocab_word]
		get_parent().move_child(description, node_index+1)
		defOpen = true
	else:
		description.queue_free()
		defOpen = false
	
