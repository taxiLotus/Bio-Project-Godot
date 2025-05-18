extends Button

var label

func setup(screen):
	text = Global.titles[screen]
	label = screen
	var icon_texture = load(Global.icons[screen])
	set_button_icon(icon_texture)


func _on_pressed() -> void:
	Global.handle_switch(label)
