extends AspectRatioContainer

func _process(delta: float) -> void:
	if Input.is_action_just_released("scroll_up"):
		size.x += 10
		size.y += 10
	if Input.is_action_just_released("scroll_down"):
		size.x -= 10
		size.y -= 10

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				var zoom_pos:Vector2 = get_global_mouse_position()
				var zoom_scale:float = 2.0 ** (event.factor if event.factor else 1.0)
				zoom_at(zoom_pos, zoom_scale)
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				var zoom_pos = get_global_mouse_position()
				var zoom_scale:float = 2.0 ** (-event.factor if event.factor else -1.0)
