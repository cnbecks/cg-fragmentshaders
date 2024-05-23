#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    vec2 transformed_uv = (model_uv * 2.0) - 1.0;

    // calculate theta and radius
    float theta = atan(transformed_uv.y, transformed_uv.x);
    float rad = pow(length(transformed_uv), 1.5);

    // calculate fish eye texture coordinate
    vec2 upd_uv = vec2( (rad * cos(theta)), (rad * sin(theta)) );

    // reverse scale and translate
    upd_uv = (upd_uv + 1.0) * 0.5;

    // assign the updated color
    FragColor = texture(image, upd_uv);
}
