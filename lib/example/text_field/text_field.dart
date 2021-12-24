import 'package:flutter/material.dart';

void main() {
  runApp(TextFieldExample());
}

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: TextField(
              decoration: InputDecoration(
                  enabled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ),
      ),
    );
  }
}
