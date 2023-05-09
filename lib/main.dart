import 'package:flutter/material.dart';
import 'package:xogame/x-oGame/boardScreen.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BoardScreen.routeName,
      routes: {
        BoardScreen.routeName: (context) => BoardScreen(),
      },
    );
  }
}
