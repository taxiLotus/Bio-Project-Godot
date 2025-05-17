extends TextureButton

var start_loc = position
var final_loc = Vector2(start_loc.x, start_loc.y-95)
var velocity = Vector2.ZERO
var travel_speed = 5000

var tex_norm = load("res://sprites/bottom_arrow.png")

func _ready():
	texture_normal = tex_norm
	if(Global.out == true):
		position.y = final_loc.y

func _enter_tree() -> void:
	if(Global.out == true):
		flip_v = !flip_v

func _process(delta):
	position += velocity * delta
	if Global.out == true and position.y <= final_loc.y:
		velocity.y = 0
		position.y = final_loc.y
	if Global.out == false and position.y >= start_loc.y:
		velocity.y = 0
		position.y = start_loc.y

func _on_pressed() -> void:
	if Global.out == false:
		velocity.y = -(start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
		flip_v = !flip_v
		Global.out = !Global.out
	else:
		velocity.y = (start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
		flip_v = !flip_v
		Global.out = !Global.out
		
func _on_mouse_entered() -> void:
	material.set_shader_parameter('difference', 0.1)

func _on_mouse_exited() -> void:
	material.set_shader_parameter('difference', 0)
