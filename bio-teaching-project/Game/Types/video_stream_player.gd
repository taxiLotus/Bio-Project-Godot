extends VideoStreamPlayer
var zoom_step = 1.1
var dragging := false

var last_position = Vector2()
var velocity = Vector2()
var speed = 0.2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			var mouse_position = event.position
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_at(zoom_step, mouse_position)
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_at(1/zoom_step, mouse_position)
			
			if event.button_index == MOUSE_BUTTON_MIDDLE or event.button_index == MOUSE_BUTTON_RIGHT:
				dragging = !dragging
		if event.is_released():
			if event.button_index == MOUSE_BUTTON_MIDDLE or event.button_index == MOUSE_BUTTON_RIGHT:
				dragging = !dragging

	if event is InputEventMouseMotion:
		if dragging == true:
			var movement = event.relative
			position.x += movement.x
			position.y += movement.y

func zoom_at(zoom_change, mouse_position):
	scale = scale * zoom_change
	var delta_x = (mouse_position.x - global_position.x) * (zoom_change - 1)
	var delta_y = (mouse_position.y - global_position.y) * (zoom_change - 1)
	global_position.x = global_position.x - delta_x
	global_position.y = global_position.y - delta_y
