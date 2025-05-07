extends TextureRect

var shade_var = 0
var shade_inc = 0
var darkening = false

func _on_atria_mouse_entered() -> void:
	shade_var = 0.1
	if(material.get_shader_parameter('difference') <= shade_var):
		shade_inc = 0.015
		darkening = true

func _on_atria_mouse_exited() -> void:
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
