shader_type canvas_item;

uniform float difference: hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    COLOR.rgb = tex.rgb - vec3(difference);
    COLOR.a = tex.a;
}