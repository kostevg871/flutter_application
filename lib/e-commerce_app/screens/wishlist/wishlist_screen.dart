import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';

class EWishlistScreen extends StatelessWidget {
  static const String routeName = "/wishlist";

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => EWishlistScreen());
  }

  const EWishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarECommerce(
        title: "Wishlist",
      ),
      bottomNavigationBar: ECustomBottomBar(),
    );
  }
}
