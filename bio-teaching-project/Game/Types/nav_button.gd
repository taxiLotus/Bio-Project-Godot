extends Button

var label

func setup(screen):
	if(screen != "back"):
		text = Global.titles[screen]
	else:
		text = ""
	label = screen
	var icon_texture = load(Global.icons[screen])
	set_button_icon(icon_texture)


func _on_pressed() -> void:
	Global.handle_switch(label)
