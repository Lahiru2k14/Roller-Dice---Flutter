

import 'package:flutter/material.dart';
import 'package:role_dice_test/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Roller Dice'),
            backgroundColor: Color.fromARGB(255, 84, 121, 72),
          ),
          body: const GradientContainer(
            colors: [
              Color.fromARGB(255, 0, 115, 52),
              Color.fromARGB(160, 209, 0, 228)
            ],
          )),
    );
  }
}
