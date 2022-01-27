import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_apps/e-commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';
import 'package:flutter_apps/e-commerce_app/widgets/order_summary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        bottomNavigationBar: CustomNavBar(
          screen: '/cart',
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliveryString,
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
                        SizedBox(
                          height: 330,
                          child: ListView.builder(
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                    product: state.cart
                                        .productQuantity(state.cart.products)
                                        .keys
                                        .elementAt(index),
                                    quantity: state.cart
                                        .productQuantity(state.cart.products)
                                        .values
                                        .elementAt(index));
                              }),
                        ),
                      ],
                    ),
                    OrderSummary(),
                  ],
                ),
              );
            } else {
              return Text("Something went wrong");
            }
          },
        ));
  }
}
