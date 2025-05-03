extends TextureButton

var out = false
var finalLoc = Vector2(861, 488)
var velocity = Vector2.ZERO

var tex_norm = load("res://sprites/side_arrow.png")

func _ready():
	texture_normal = tex_norm
	get_node("../ScrollContainer").vocab_pulled_out.connect(_on_vocab_pulled_out)

func _on_vocab_pulled_out() -> void:
	if out == false:
		velocity.x = -5000
		out = !out
	else:
		velocity.x = 5000
		out = !out

func _process(delta):
	position += velocity * delta
	if out == true and position.x < finalLoc.x:
		velocity.x = 0
	if out == false and position.x > 982.0:
		velocity.x = 0
