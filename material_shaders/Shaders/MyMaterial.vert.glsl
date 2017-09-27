#version 450

in vec3 pos;
in vec3 nor;

uniform mat4 WVP;
uniform float time;

out vec4 p;

void main() {
	p = vec4(pos, 1.0);
	p.z += sin((time + pos.x + pos.y) * 2.0) * 0.2;
	gl_Position = WVP * p;
}
