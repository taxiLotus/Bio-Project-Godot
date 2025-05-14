extends TextureRect

var shade_var = 0
var darkest_shade = 0.25

var shade_inc = 0
var shade_speed = 0.05

var darkening = false
var focused = false
var hovering = false
var all_organ_parts


signal organ_pressed

func _ready() -> void:
	all_organ_parts = get_all_children(get_parent().get_path())
	connect_signals()
	
func connect_signals():
	OrganBus.mouse_entered.connect(_on_organ_mouse_entered)
	OrganBus.mouse_exited.connect(_on_organ_mouse_exited)
	OrganBus.focus_entered.connect(_on_organ_focus_entered)
	OrganBus.focus_exited.connect(_on_organ_focus_exited)
	OrganBus.pressed.connect(_on_organ_pressed)

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
	hovering = true
	shade_var = darkest_shade
	if(material.get_shader_parameter('difference') <= shade_var):
		shade_inc = shade_speed
		darkening = true

func _on_organ_mouse_entered() -> void:
	hovering = true
	shade_var = darkest_shade
	if(material.get_shader_parameter('difference') <= shade_var):
		shade_inc = shade_speed
		darkening = true

func _on_organ_mouse_exited() -> void:
	hovering = false
	if focused == false:
		shade_var = 0
		if(material.get_shader_parameter('difference') >= shade_var):
			shade_inc = -shade_speed
			darkening = false
	
func _on_organ_focus_entered() -> void:
	focused = true
	
func _on_organ_focus_exited() -> void:
	focused = false
	shade_var = 0
	if(material.get_shader_parameter('difference') >= shade_var):
		shade_inc = -shade_speed
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
			grab_focus()
			shade_var = 0
			if(material.get_shader_parameter('difference') >= shade_var):
				shade_inc = -shade_speed
				darkening = false
