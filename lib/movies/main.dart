import 'package:flutter/material.dart';
import 'package:flutter_apps/movies/widgets/main_screen/main_screen_widget.dart';

import 'widgets/auth/auth_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: const Color.fromRGBO(3, 37, 65, 1)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/auth': (context) => AuthWidgets(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth',
      // home: AuthWidgets(),
    );
  }
}
