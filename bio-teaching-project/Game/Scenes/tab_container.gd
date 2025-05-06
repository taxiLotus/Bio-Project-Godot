extends PanelContainer

var out = false
var start_loc = position
var final_loc = Vector2(start_loc.x, start_loc.y-160)
var velocity = Vector2.ZERO
var travel_speed = 5000


func _ready():
	get_node("../BottomPannelExpand").pressed.connect(_on_pressed)
	

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
		out = !out
	else:
		velocity.y = (start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
		out = !out
