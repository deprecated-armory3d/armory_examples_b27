#version 450

in vec4 p;

out vec4 fragColor;

void main() {
	vec3 col = (p.xyz + vec3(1.0)) / 8.0;
	fragColor = vec4(col, 1.0);
}
