extends Button

var destination
var hovering = false

func set_word(dest):
	destination = dest
	text = "  Navigate to " + destination + " >>  "

func _on_pressed() -> void:
	Global.handle_switch(destination)

func _ready() -> void:
	get_parent().focus_exited.connect(_on_parent_exited)
	
func _on_parent_exited():
	if hovering == false:
		queue_free()


func _on_mouse_entered() -> void:
	hovering = true


func _on_mouse_exited() -> void:
	hovering = false
