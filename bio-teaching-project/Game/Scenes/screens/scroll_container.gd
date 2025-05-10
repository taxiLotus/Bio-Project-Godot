extends ScrollContainer

var out = false
var start_loc = position
var final_loc = Vector2(start_loc.x-235, start_loc.y)
var velocity = Vector2.ZERO
var travel_speed = 5000

signal vocab_pulled_out

func _ready() -> void:
	OrganBus.pressed.connect(_on_organ_pressed)

func _on_organ_pressed():
	if(out == false):
		_on_button_pressed()

func _on_button_pressed() -> void:
	if out == false:
		velocity.x = -(start_loc.x - final_loc.x)/((start_loc.x - final_loc.x)/travel_speed)
		out = !out
		vocab_pulled_out.emit()
	else:
		velocity.x = (start_loc.x - final_loc.x)/((start_loc.x - final_loc.x)/travel_speed)
		out = !out
		vocab_pulled_out.emit()

func _process(delta):
	
	
	position += velocity * delta
	if out == true and position.x <= final_loc.x:
		velocity.x = 0
		position.x = final_loc.x
	if out == false and position.x >= start_loc.x:
		velocity.x = 0
		position.x = start_loc.x
