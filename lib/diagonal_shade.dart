library some_shaders;

import 'package:flutter/widgets.dart';
import 'package:flutter_shaders/flutter_shaders.dart';


class DiagonalShade extends StatelessWidget {
  const DiagonalShade({
    required this.child,
    required this.color,
    this.borderRadius = const Radius.circular(0),
    super.key,
  });

  final Radius borderRadius;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, _) {
        return AnimatedSampler(
          (image, size, canvas) {
            shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, color.red / 255)
              ..setFloat(3, color.green / 255)
              ..setFloat(4, color.blue / 255)
              ..setFloat(5, color.opacity)
              ..setImageSampler(0, image);

            canvas.drawRRect(
              RRect.fromRectAndRadius(
                Offset.zero & size,
                borderRadius,
              ),
              Paint()..shader = shader,
            );
          },
          child: child,
        );
      },
      assetKey: 'packages/some_shaders/assets/shaders/diagonal_lines.frag',
    );
  }
}
