import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/e_commerce_backend/screens/home_sccreen_backend.dart';
import 'package:flutter_apps/e_commerce_backend/screens/new_product_screen_back.dart';
import 'package:flutter_apps/e_commerce_backend/screens/product_screen_back.dart';
import 'package:get/get.dart';

import 'screens/order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppEcommerceBackend());
}

class AppEcommerceBackend extends StatelessWidget {
  const AppEcommerceBackend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "E-commerce app back",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenBack(),
      getPages: [
        GetPage(name: "/products", page: () => ProductScreenBack()),
        GetPage(name: "/products/new", page: () => NewProductScreenBack()),
        GetPage(name: "/orders", page: () => OrderScreen()),
      ],
    );
  }
}
