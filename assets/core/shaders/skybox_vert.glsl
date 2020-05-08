#version 450

#include "library/common.glsl"

layout(location = 0) out vec3 v_Uv;

void main() {
    vec4 pos = vec4(0.0);
    switch(gl_VertexIndex) {
        case 0: pos = vec4(-1.0, -1.0, 0.0, 1.0); break;
        case 1: pos = vec4( 3.0, -1.0, 0.0, 1.0); break;
        case 2: pos = vec4(-1.0,  3.0, 0.0, 1.0); break;
    }
    mat3 invModelView = transpose(mat3(view));
    vec3 unProjected = (inverse(projection) * pos).xyz;
    v_Uv = invModelView * unProjected;

    gl_Position = pos;
    gl_Position.z *= -1.0;
}