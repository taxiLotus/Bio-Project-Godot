extends TextureRect

var shade_var = 0
var shade_inc = 0
var darkening = false
var focused = false
var hovering = false
var all_organ_parts

signal organ_pressed

func _ready() -> void:
	all_organ_parts = get_all_children(get_parent().get_path())
	connect_signals()
	
func connect_signals():
	var check_organs : int = 0
	while check_organs < all_organ_parts.size():
		var organ = all_organ_parts[check_organs]
		organ.connect("mouse_entered", _on_organ_mouse_entered)
		organ.connect("mouse_exited", _on_organ_mouse_exited)
		organ.connect("focus_entered", _on_organ_focus_entered)
		organ.connect("focus_exited", _on_organ_focus_exited)
		organ.connect("pressed", _on_organ_pressed)
		check_organs += 1

func get_all_children(in_node_path: NodePath, arr := []):
	var in_node = get_node(in_node_path)
	arr.push_back(in_node)
	for child in in_node.get_children():
		var child_path = child.get_path()
		arr = get_all_children(child_path, arr)
		arr.remove_at(0)
	return arr

func _on_organ_pressed() -> void:
	emit_signal("organ_pressed")

func _on_organ_mouse_entered() -> void:
	hovering = true
	shade_var = 0.1
	if(material.get_shader_parameter('difference') <= shade_var):
		shade_inc = 0.015
		darkening = true

func _on_organ_mouse_exited() -> void:
	hovering = false
	if focused == false:
		shade_var = 0
		if(material.get_shader_parameter('difference') >= shade_var):
			shade_inc = -0.015
			darkening = false
	
func _on_organ_focus_entered() -> void:
	focused = true
	
func _on_organ_focus_exited() -> void:
	focused = false
	shade_var = 0
	if(material.get_shader_parameter('difference') >= shade_var):
		shade_inc = -0.015
		darkening = false
	
func _process(delta: float) -> void:
	material.set_shader_parameter('difference', material.get_shader_parameter('difference') + shade_inc)
	
	if darkening == true and material.get_shader_parameter('difference') >= shade_var:
		shade_inc = 0
		material.set_shader_parameter('difference', shade_var)
	if darkening == false and material.get_shader_parameter('difference') <= shade_var:
		shade_inc = 0
		material.set_shader_parameter('difference', shade_var)
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if hovering == false:
			release_focus()
			shade_var = 0
			if(material.get_shader_parameter('difference') >= shade_var):
				shade_inc = -0.015
				darkening = false
