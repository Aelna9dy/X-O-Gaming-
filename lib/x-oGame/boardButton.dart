import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoardButton extends StatelessWidget {
  String text;
  Function onClicked;
  int index;

  BoardButton(this.onClicked, this.text, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClicked(index);
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
