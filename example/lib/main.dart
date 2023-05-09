import 'package:flutter/material.dart';
import 'package:some_shaders/grain_texture.dart';

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
            strength: 0.2,
            probability: 0.6,
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 60,
                )),
                padding: MaterialStatePropertyAll(EdgeInsets.all(40)),
              ),
              child: const Text('Click the button'),
            ),
          ),
        ),
      ),
    );
  }
}
