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
    // horizontal wave effect!
    // scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    vec2 transformed_uv = (model_uv * 2.0) - 1.0;

    // create variables to hold attributes of the wave
    float amplitude = 0.25;
    float frequency = 4.0 * 3.14159;

    // create the wave waveform
    float wave = sin( transformed_uv.x * (u_time - frequency) ) * amplitude;

    // grab a color from a different pixel in accordance with the wave
    vec2 upd_uv = vec2( transformed_uv.x, (transformed_uv.y + wave) );

    // reverse scale and translate
    upd_uv = (upd_uv + 1.0) * 0.5;

    // assign the updated color
    FragColor = texture(image, upd_uv);
}
