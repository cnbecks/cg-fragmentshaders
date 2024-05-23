#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // round each color component to one of 5 levels (0.0, 0.25, 0.5, 0.75, 1.0)
    vec4 toon_color = texture(image, model_uv);
    toon_color.r = round(toon_color.r * 4.0) / 4.0;
    toon_color.g = round(toon_color.g * 4.0) / 4.0;
    toon_color.b = round(toon_color.b * 4.0) / 4.0;

    // update assigned color
    FragColor = toon_color;
}
