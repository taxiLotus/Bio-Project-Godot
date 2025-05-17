extends TextureButton

func _on_mouse_entered() -> void:
	size.x += 15
	size.y += 15
	rotation += -.05
	position.x += 1
	position.y += 1


func _on_mouse_exited() -> void:
	size.x -= 15
	size.y -= 15
	rotation += .05
	position.x += -1
	position.y += -1
