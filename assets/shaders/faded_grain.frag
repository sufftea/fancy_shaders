#version 460 core

#include <flutter/runtime_effect.glsl>

// #define PI 3.1415926535

precision mediump float;

uniform vec2 resolution;
uniform sampler2D tex;

out vec4 fragColor;


float rand(vec2 n) { 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec4 shade() {
  const vec2 pixelation = resolution * 1;
  const float offset = 0.6;

  vec2 st = FlutterFragCoord().xy / resolution;
  vec4 tc = texture(tex, st);

  st.y += st.x * 0.1;

  st = round(st * pixelation) / pixelation;

  if (tc.a < 0.1) {
    return tc;
  }

  float density = pow(st.y, 4);

  float r = rand(st);

  if (r < density) {
    return vec4(0, 0, 0, 0);
  }
  return tc;
}

void main() {
  fragColor = shade();
}
