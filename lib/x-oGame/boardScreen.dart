import 'package:flutter/material.dart';

import 'boardButton.dart';
import 'customText.dart';

class BoardScreen extends StatefulWidget {
  static const routeName = "Board-Screen";

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " X-O Game",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {
                  Restart();
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomText(text: "person: 1(x)"),
                      CustomText(text: "Score: $player1Score"),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      CustomText(text: "person: 2(O)"),
                      CustomText(text: "Score: $player2Score"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(onPlayerClick, boardState[0], 0),
                  BoardButton(onPlayerClick, boardState[1], 1),
                  BoardButton(onPlayerClick, boardState[2], 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(onPlayerClick, boardState[3], 3),
                  BoardButton(onPlayerClick, boardState[4], 4),
                  BoardButton(onPlayerClick, boardState[5], 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(onPlayerClick, boardState[6], 6),
                  BoardButton(onPlayerClick, boardState[7], 7),
                  BoardButton(onPlayerClick, boardState[8], 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    print("Player clicked on button $index");

    if (counter % 2 == 0) {
      boardState[index] = "x";
      // player1Score++;
    } else {
      boardState[index] = "o";
      // player2Score++;
    }

    counter++;

    //check winner
    if (checkWinner("x")) {
      // x is winner
      player1Score += 1;
      resetBoard();
    } else if (checkWinner("o")) {
      // o is winner
      player2Score += 1;
      resetBoard();
    } else if (counter == 9) {
      resetBoard();
    }

    setState(() {});
  }

  bool checkWinner(String playerSymbole) {
    //check for Row
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == playerSymbole &&
          boardState[i + 1] == playerSymbole &&
          boardState[i + 2] == playerSymbole) {
        return true;
      }
    }

    //check for column
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == playerSymbole &&
          boardState[i + 3] == playerSymbole &&
          boardState[i + 6] == playerSymbole) {
        return true;
      }

      if (boardState[0] == playerSymbole &&
          boardState[4] == playerSymbole &&
          boardState[8] == playerSymbole) {
        return true;
      }

      if (boardState[2] == playerSymbole &&
          boardState[4] == playerSymbole &&
          boardState[6] == playerSymbole) {
        return true;
      }
    }
    return false;
  }

  void resetBoard() {
    boardState = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
  }

  void Restart() {
    player1Score = 0;
    player2Score = 0;
  }
}
