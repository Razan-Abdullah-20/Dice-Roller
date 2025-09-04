import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = "images/dice-2.png";
  final List<String> DiceImages = [
    "images/dice-1.png",
    "images/dice-2.png",
    "images/dice-3.png",
    "images/dice-4.png",
    "images/dice-5.png",
    "images/dice-6.png",
  ];
  final random = Random();

  int counter = 0;
  int currentRoll = 0;
  int highScore = 0;

  void rollDice() {
    setState(() {
      counter++;
      int randomIndex = random.nextInt(DiceImages.length);
      activeDiceImage = DiceImages[randomIndex];
      currentRoll = randomIndex + 1;
      if (currentRoll > highScore) {
        highScore = currentRoll;
      }
    });
  }

  void Restart() {
    setState(() {
      counter = 0;
      activeDiceImage = "images/dice-2.png";
      currentRoll = 0;
      highScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Rolls: $counter',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              'Highest Roll: $highScore',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 300,
          width: 300,
          child: TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(padding: EdgeInsets.all(20)),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(turns: animation, child: child);
              },
              child: Image.asset(
                activeDiceImage,
                key: ValueKey<String>(activeDiceImage),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(padding: EdgeInsets.all(20)),
          child: Text(
            'Roll Dice!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: Restart,
          style: TextButton.styleFrom(padding: EdgeInsets.all(20)),
          child: Text(
            'Restart',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
