import 'package:flutter/material.dart';
import 'package:flutter_apps/e_commerce_backend/screens/order_screen.dart';
import 'package:flutter_apps/e_commerce_backend/screens/product_screen_back.dart';
import 'package:get/get.dart';

class HomeScreenBack extends StatelessWidget {
  const HomeScreenBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E-commerce back",
        ),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductScreenBack());
                },
                child: Card(
                  child: Center(
                    child: Text("Go to product"),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => OrderScreen());
                },
                child: Card(
                  child: Center(
                    child: Text("Go to orders"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
