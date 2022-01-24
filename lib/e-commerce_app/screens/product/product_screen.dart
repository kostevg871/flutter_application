import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';

class EProductScreen extends StatelessWidget {
  static const String routeName = "/product";

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => EProductScreen());
  }

  const EProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarECommerce(
        title: "Product",
      ),
      bottomNavigationBar: ECustomBottomBar(),
    );
  }
}
