import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class GrainTexture extends StatelessWidget {
  const GrainTexture({
    required this.child,
    this.borderRadius,
    this.strength = 0.2,
    this.probability = 0.9,
    super.key,
  });

  final Widget child;

  final Radius? borderRadius;
  final double strength;
  final double probability;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, _) {
        return AnimatedSampler(
          (image, size, canvas) {
            if (borderRadius != null) {
              canvas.clipRRect(RRect.fromRectAndRadius(
                Offset.zero & size,
                borderRadius!,
              ));
            }

            shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, strength)
              ..setFloat(3, probability)
              ..setImageSampler(0, image);

            canvas.drawRect(
              const Rect.fromLTWH(20, 20, 40, 40),
              Paint()..color = Colors.red,
            );

            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: child,
        );
      },
      assetKey: 'packages/some_shaders/assets/shaders/paper.frag',
    );
  }
}
