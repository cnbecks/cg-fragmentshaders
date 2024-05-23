#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float u_time;

// Output
out vec4 FragColor;

void main() {
    // scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    vec2 transformed_uv = (model_uv * 2.0) - 1.0;

    // calculate radius
    float rad = length(transformed_uv);

    // calculate a texture coordinate offset 
    vec2 offset = transformed_uv * ( (sin(rad * 30.0 - u_time * 5.0) + 0.5) / 60.0 );

    // calculate final texture coordinate
    vec2 upd_uv = offset + model_uv;

    // assign the updated color
    FragColor = texture(image, upd_uv);
}
