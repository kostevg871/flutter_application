import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';

class ECartScreen extends StatelessWidget {
  static const String routeName = "/cart";

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ECartScreen());
  }

  const ECartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarECommerce(
        title: "Cart",
      ),
      bottomNavigationBar: ECustomBottomBar(),
    );
  }
}
