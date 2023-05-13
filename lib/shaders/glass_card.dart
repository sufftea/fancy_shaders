// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, child) {
        return AnimatedSampler(
          (image, size, canvas) {
            shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, 1)
              ..setFloat(3, 0.2)
              ..setImageSampler(0, image);

            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: child!,
        );
      },
      assetKey: 'assets/shaders/glass.frag',
      child: Center(
        child: Text(
          'Some text',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
