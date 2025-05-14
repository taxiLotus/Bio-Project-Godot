extends RichTextLabel

func _ready() -> void:
	text = "Currently at: " + Global.current_organ_title
