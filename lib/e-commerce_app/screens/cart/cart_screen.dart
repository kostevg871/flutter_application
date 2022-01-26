import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/models/models.dart';
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "GO TO CHECKOUT",
                    style: Theme.of(context).textTheme.headline3,
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add \$20.0 for FREE Delivery",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: Text(
                        'Add More Item',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                CartProductCard(product: Product.products[0]),
              ],
            ),
            Column(
              children: [
                Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SUBTOTAL",
                              style: Theme.of(context).textTheme.headline5),
                          Text("\$5.98",
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("DELIVERY FREE",
                              style: Theme.of(context).textTheme.headline5),
                          Text("\$2.98",
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("DELIVERY FREE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white)),
                            Text("\$12.98",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
