extends Button

var out = false
var finalLoc = Vector2(861, 488)
var velocity = Vector2.ZERO

var icon_img = load("res://sprites/Caret-PNG-Image-470481549.png")

func _ready():
	icon = icon_img

func _on_button_pressed() -> void:
	if out == false:
		velocity.x = -5000
		out = true
	else:
		out = false

func _process(delta):
	position += velocity * delta
	if out == true and position.x < finalLoc.x:
		velocity.x = 0
