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
