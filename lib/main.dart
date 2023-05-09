import 'package:flutter/material.dart';
import 'package:some_shaders/shaders/grain_texture.dart';

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
            strength: 0.2,
            probability: 0.6,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                  elevation: const MaterialStatePropertyAll(20),
                  textStyle: const MaterialStatePropertyAll(TextStyle(
                    fontSize: 60,
                  )),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(40)),
                ),
                child: const Text('Click the button'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
