
import 'package:flutter/material.dart';
import 'package:role_dice_test/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: beginAlignment, end: endAlignment)),
        child: const Center(child: RollerDice()));
  }
}
