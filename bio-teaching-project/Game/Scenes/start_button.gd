extends TextureButton

var norm_texture = load("res://sprites/heart_norm.png")
var scalar = 10

func _ready():
	texture_normal = norm_texture



func _on_mouse_entered() -> void:
	size += Vector2(scalar,scalar)
	position += Vector2(-scalar/2,-scalar/2)


func _on_mouse_exited() -> void:
	size -= Vector2(scalar,scalar)
	position -= Vector2(-scalar/2,-scalar/2)
