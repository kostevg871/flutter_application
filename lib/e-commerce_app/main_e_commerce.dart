import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/config/app_router.dart';

import 'config/theme.dart';
import 'screens/home/e_home_page.dart';

void main() {
  runApp(AppEcommerce());
}

class AppEcommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-commerce",
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: EHomeScreen.routeName,
      home: EHomeScreen(),
    );
  }
}
