#version 460 core

#include <flutter/runtime_effect.glsl>

// #define PI 3.1415926535

precision mediump float;

uniform vec2 resolution;
uniform float strength; // from -1 to 1 (darkening/lightening)
uniform float probability; // from 0 to 1
uniform sampler2D tex;

out vec4 fragColor;


float rand(vec2 n) { 
	return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec4 shade() {
  vec2 st = FlutterFragCoord().xy / resolution;
  vec4 tc = texture(tex, st);

  if (tc.a < 1) {
    return tc;
  }

  float r1 = rand(st);
  float r2 = rand(st);

  if (r2 > probability) {
    return tc;
  }

  

  vec4 res = mix(tc, tc + vec4(r1, r1, r1, 1), strength);

  return vec4(res.r, res.g, res.b, 1);
}


void main() {
  fragColor = shade();
}
