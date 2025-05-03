extends ScrollContainer

var out = false
var finalLoc = Vector2(956.0, 224)
var velocity = Vector2.ZERO

signal vocab_pulled_out

func _on_button_pressed() -> void:
	if out == false:
		velocity.x = -5000
		out = true
		vocab_pulled_out.emit()
	else:
		velocity.x = 5000
		out = false
		vocab_pulled_out.emit()

func _process(delta):
	position += velocity * delta
	if out == true and position.x < finalLoc.x:
		velocity.x = 0
	if out == false and position.x > 1191.0:
		velocity.x = 0
