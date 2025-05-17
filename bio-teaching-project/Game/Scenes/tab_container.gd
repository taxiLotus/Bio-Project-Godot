extends ScrollContainer

var start_loc = position
var final_loc = Vector2(start_loc.x, start_loc.y-170)
var velocity = Vector2.ZERO
var travel_speed = 5000


func _ready():
	get_node("../BottomPannelExpand").pressed.connect(_on_expand_pressed)
	
func _enter_tree() -> void:
	if(Global.out == true):
		_on_expand_pressed()
		position.y = final_loc.y

func _process(delta):
	position += velocity * delta
	if Global.out == true and position.y <= final_loc.y:
		velocity.y = 0
		position.y = final_loc.y
	if Global.out == false and position.y >= start_loc.y:
		velocity.y = 0
		position.y = start_loc.y

func _on_expand_pressed() -> void:
	if Global.out == true:
		velocity.y = -(start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
	else:
		velocity.y = (start_loc.y - final_loc.y)/((start_loc.y - final_loc.y)/travel_speed)
