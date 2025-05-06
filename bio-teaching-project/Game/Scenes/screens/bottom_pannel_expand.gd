extends TextureButton

var out = false
var start_loc = position
var final_loc = Vector2(start_loc.x, start_loc.y-88)
var velocity = Vector2.ZERO
var travel_speed = 5000

var tex_norm = load("res://sprites/bottom_arrow.png")

func _ready():
	texture_normal = tex_norm
	

func _process(delta):
	position += velocity * delta
	if out == true and position.y <= final_loc.y:
		velocity.y = 0
		position.y = final_loc.y
	if out == false and position.y >= start_loc.y:
		velocity.y = 0
		position.y = start_loc.y

func _on_pressed() -> void:
	if out == false:
		velocity.y = -(start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
		flip_v = !flip_v
		out = !out
	else:
		velocity.y = (start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
		flip_v = !flip_v
		out = !out
