extends TextureButton

var is_over = false

func _on_mouse_entered() -> void:
	size.x += 15
	size.y += 15
	rotation += -.05
	position.x += 1
	position.y += 1
	is_over = true


func _on_mouse_exited() -> void:
	size.x -= 15
	size.y -= 15
	rotation += .05
	position.x += -1
	position.y += -1
	is_over = false
	
	
signal clicked
func _input(event: InputEvent) -> void:
	if event.is_pressed():
		if is_over == true:
			clicked.emit()
