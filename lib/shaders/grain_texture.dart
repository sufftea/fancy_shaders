import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class GrainTexture extends StatelessWidget {
  const GrainTexture({
    required this.child,
    this.strength = 0.2,
    this.probability = 0.9,
    super.key,
  });

  final Widget child;

  final double strength;
  final double probability;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, child) {
        return AnimatedSampler(
          (image, size, canvas) {
            shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, strength)
              ..setFloat(3, probability)
              ..setImageSampler(0, image);

            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: child!,
        );
      },
      assetKey: 'assets/shaders/grain.frag',
      child: child,
    );
  }
}
