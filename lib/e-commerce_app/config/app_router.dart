import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/models/models.dart';
import 'package:flutter_apps/e-commerce_app/screens/checkout/checkout.dart';
import 'package:flutter_apps/e-commerce_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("This is route: ${settings.name}");

    switch (settings.name) {
      case '/':
        return EHomeScreen.route();
      case EHomeScreen.routeName:
        return EHomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case ECartScreen.routeName:
        return ECartScreen.route();
      case ECatalogScreen.routeName:
        return ECatalogScreen.route(category: settings.arguments as Category);
      case EProductScreen.routeName:
        return EProductScreen.route(product: settings.arguments as Product);
      case EWishlistScreen.routeName:
        return EWishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: "/error"),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
            ));
  }
}
