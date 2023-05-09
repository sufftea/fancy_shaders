#version 460 core

#include <flutter/runtime_effect.glsl>

#define PI 3.1415926535

precision mediump float;

uniform vec2 resolution;
uniform vec4 color;
uniform sampler2D tex;

out vec4 fragColor;

vec3 blend(vec3 a, vec3 b, float opacity) {
  return mix(a, b, opacity);
}

void main() {
  vec2 st = FlutterFragCoord().xy / resolution.xy;
  vec2 pixCords = FlutterFragCoord().xy;
  pixCords /= 5;

  vec4 texCol = texture(tex, st);
  vec4 overCol = color * step(0.5, sin(pixCords.x + pixCords.y) * 0.5 + 0.5);

  vec3 res = blend(texCol.rgb, overCol.rgb, overCol.a);
  fragColor = vec4(res, texCol.a);
}
