
import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() {
    return _RollerDiceState();
  }
}

class _RollerDiceState extends State<RollerDice> {
  var diceNumber = 1;

  int playerOnePressCount = 0;
  int playerTwoPressCount = 0;

  List<int> playerOneValues = [];
  int playerOnePoints = 0;
  List<int> playerTwoValues = [];
  int playerTwoPoints = 0;

  void firstPlayerRoll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;

      playerOneValues.add(diceNumber);
      playerOnePressCount++;

      calculateSum();

      if (playerOnePressCount == 5 && playerTwoPressCount == 5) {
        calculateWinner();
      }
    });
  }

  void secondPlayerRoll() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwoValues.add(diceNumber);
      playerTwoPressCount++;

      calculateSum();

      if (playerOnePressCount == 5 && playerTwoPressCount == 5) {
        calculateWinner();
      }
    });
  }

  void calculateSum() {
    int _calculateSum(List<int> values) {
      return values.fold(0, (sum, value) => sum + value);
    }

    for (int i = 0; i < 5; i++) {
      playerOnePoints = _calculateSum(playerOneValues);
      playerTwoPoints = _calculateSum(playerTwoValues);
    }
  }

  void calculateWinner() {
    String winner =
        (playerOnePoints > playerTwoPoints) ? 'Player 1' : 'Player 2';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over', style: TextStyle(color: Colors.red)),
          content: Text('$winner is the winner!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  diceNumber = 1;
                  playerOnePressCount = 0;
                  playerTwoPressCount = 0;
                  playerOneValues = [];
                  playerOnePoints = 0;
                  playerTwoValues = [];
                  playerTwoPoints = 0;
                });
              },
              child: const Text('Play again'),
            ),
          ],
        );
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 150,
        ),
        const SizedBox(
          height: 100,
        ),
        TextButton(
            onPressed: (playerOnePressCount < 5) ? firstPlayerRoll : null,
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 203, 57, 57),
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 28, fontStyle: FontStyle.italic)),
            child: const Text('Player One')),
        const SizedBox(height: 20),
        Text('Player Dice History: $playerOneValues',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
        Text('Player Sum: $playerOnePoints',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: (playerTwoPressCount < 5) ? secondPlayerRoll : null,
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 203, 57, 57),
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 28, fontStyle: FontStyle.italic)),
            child: const Text('Player Two ')),
        const SizedBox(height: 20),
        Text('Player Dice History: $playerTwoValues',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
        Text('Player Sum: $playerTwoPoints',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}



