import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class TranslucentCard extends StatelessWidget {
  const TranslucentCard({super.key});

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
      assetKey: 'assets/shaders/glass.frag',
      child: SizedBox(
        width: 400,
        height: 500,
        // child: Center(
        //   child: Text(
        //     'Some text',
        //     style: TextStyle(fontSize: 40),
        //   ),
        // ),
        child: Image.network(
          'https://i.pinimg.com/originals/36/e2/db/36e2db2a504c117a5b4b4441182ed770.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
