import 'package:flutter/material.dart';
import 'package:some_shaders/shaders/faded_button.dart';
import 'package:some_shaders/shaders/translucent_card.dart';

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
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned.fill(
              child: Image.network(
                'https://i.pinimg.com/originals/36/e2/db/36e2db2a504c117a5b4b4441182ed770.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Column(
                children: [
                  Spacer(),
                  TranslucentCard(),
                  Spacer(),
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
