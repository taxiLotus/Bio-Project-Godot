extends TextureButton

var out = false
var start_loc = position
var final_loc = Vector2(start_loc.x-178, start_loc.y)
var velocity = Vector2.ZERO
var travel_speed = 5000

var tex_norm = load("res://sprites/side_arrow.png")

func _ready():
	texture_normal = tex_norm
	get_node("../ScrollContainer").vocab_pulled_out.connect(_on_vocab_pulled_out)

func _on_vocab_pulled_out() -> void:
	if out == false:
		velocity.x = -(start_loc.x - final_loc.x)/((start_loc.x - final_loc.x)/travel_speed)
		flip_h = !flip_h
		out = !out
	else:
		velocity.x = (start_loc.x - final_loc.x)/((start_loc.x - final_loc.x)/travel_speed)
		flip_h = !flip_h
		out = !out

func _process(delta):
	position += velocity * delta
	if out == true and position.x <= final_loc.x:
		velocity.x = 0
		position.x = final_loc.x
	if out == false and position.x >= start_loc.x:
		velocity.x = 0
		position.x = start_loc.x


func _on_mouse_entered() -> void:
	material.set_shader_parameter('difference', 0.1)

func _on_mouse_exited() -> void:
	material.set_shader_parameter('difference', 0)
