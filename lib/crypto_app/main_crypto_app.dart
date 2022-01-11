import 'package:flutter/material.dart';
import 'package:flutter_apps/crypto_app/pages/crypto_home_page.dart';

void main() {
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CryptoHomePage(),
    );
  }
}
