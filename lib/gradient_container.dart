import 'package:flutter/material.dart';
import 'dice_roller.dart';

class ContainerClass extends StatelessWidget {
  ContainerClass(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Container(
          child: Image.asset(
            "images/Dice-background3.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),*/
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
        ),
        Center(child: DiceRoller()),
      ],
    );
  }
}
