import 'package:flutter/material.dart';
import 'package:some_shaders/paper_texture.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Center(
          child: GrainTexture(
            borderRadius: const Radius.circular(40),
            strength: -0.9,
            probability: 0.2,
            child: Container(
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Text(
                'Something',
                style: TextStyle(
                  fontSize: 80,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
