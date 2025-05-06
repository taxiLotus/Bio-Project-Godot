extends Button

var vocab_word: String
var defOpen := false

func _ready() -> void:
	get_node("../../../ClickableOrgan/Container/Atria").pressed.connect(_on_organ_pressed)

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
	
