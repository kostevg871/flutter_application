import 'package:flutter/material.dart';

void main() {
  runApp(CHomePage());
}

class CHomePage extends StatelessWidget {
  const CHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ConstParam(),
      ),
    );
  }
}

class ConstParam extends StatelessWidget {
  const ConstParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Коэффицент упаривания градирни: Ky",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          "2.3",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
