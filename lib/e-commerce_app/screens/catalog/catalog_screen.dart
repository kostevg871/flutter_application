import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';

class ECatalogScreen extends StatelessWidget {
  static const String routeName = "/catalog";

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ECatalogScreen());
  }

  const ECatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarECommerce(
        title: "Catalog",
      ),
      bottomNavigationBar: ECustomBottomBar(),
    );
  }
}
