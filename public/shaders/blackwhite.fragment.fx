#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // calculate the luminance of the frame 
    vec4 bw_color = texture(image, model_uv);
    float luminance = (bw_color.r * 0.299) + (bw_color.g * 0.587) + (bw_color.b * 0.114);

    // assign the luminance value to all three color components
    bw_color.r = luminance;
    bw_color.g = luminance;
    bw_color.b = luminance;

    // assign the updated color
    FragColor = bw_color;
}
