#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;
layout (location = 3) in mat4 aModelMatrix;

layout (std140) uniform Matrices
{
	mat4 projection;
	mat4 view;
};

uniform mat4 alteration;

out vec3 normal;
out vec3 fragPos;
out vec2 texCoord;

void main()
{
	mat4 model = alteration * aModelMatrix;
	fragPos = vec3(model * vec4(aPos, 1.0));
    normal = mat3(transpose(inverse(model))) * aNormal; 
	texCoord = aTexCoord;

	gl_Position = projection * view * vec4(fragPos, 1.0);
}