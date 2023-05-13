// ignore_for_file: prefer_const_constructors

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:some_shaders/shaders/faded_button.dart';
import 'package:some_shaders/shaders/glass_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  static const double glassWidth = 300;
  static const double glassHeight = 300;

  final glassRect = ValueNotifier(Rect.fromLTWH(0, 0, glassHeight, glassWidth));

  Offset? dragOffset;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.expand,
            children: [
              buildBackground(),
              buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return AnimatedBuilder(
      animation: glassRect,
      builder: (context, child) {
        return Positioned.fromRect(
          rect: glassRect.value,
          child: Listener(
            onPointerDown: (event) {
              dragOffset = event.localPosition;
            },
            onPointerMove: (event) {
              glassRect.value = Rect.fromLTWH(
                event.position.dx - dragOffset!.dx,
                event.position.dy - dragOffset!.dy,
                glassWidth,
                glassHeight,
              );
            },
            onPointerCancel: (event) {
              dragOffset = null;
            },
            onPointerUp: (event) {
              dragOffset = null;
            },
            child: Container(
              color: Colors.transparent,
              width: glassRect.value.width,
              height: glassRect.value.height,
              child: GlassCard(),
            ),
          ),
        );
      },
    );
  }

  Widget buildBackground() {
    return Positioned.fill(
      child: ShaderBuilder(
        (context, shader, child) {
          return AnimatedBuilder(
            animation: glassRect,
            builder: (context, _) {
              return AnimatedSampler(
                (image, size, canvas) {
                  shader
                    ..setFloat(0, size.width)
                    ..setFloat(1, size.height)
                    ..setFloat(2, glassRect.value.left)
                    ..setFloat(3, glassRect.value.top)
                    ..setFloat(4, glassRect.value.width)
                    ..setFloat(5, glassRect.value.height)
                    ..setImageSampler(0, image);

                  canvas.drawRect(
                    Offset.zero & size,
                    Paint()..shader = shader,
                  );
                },
                child: child!,
              );
            },
          );
        },
        assetKey: 'assets/shaders/glass_rect.frag',
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              'https://i.pinimg.com/originals/36/e2/db/36e2db2a504c117a5b4b4441182ed770.jpg',
              fit: BoxFit.cover,
            ),
            const Positioned.fill(
              child: Column(
                children: [
                  Spacer(flex: 5),
                  FadedButton(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
