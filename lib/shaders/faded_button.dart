import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class FadedButton extends StatelessWidget {
  const FadedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, child) {
        return AnimatedSampler(
          (image, size, canvas) {
            shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setImageSampler(0, image);

            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: child!,
        );
      },
      assetKey: 'assets/shaders/faded_grain.frag',
      child: buildChild(),
    );
  }

  Widget buildChild() {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(40)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
          textStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: 60,
          ))),
      child: const Text('Click here'),
    );
  }
}
