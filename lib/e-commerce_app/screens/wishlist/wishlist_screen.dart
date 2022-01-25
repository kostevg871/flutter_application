import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_apps/e-commerce_app/widgets/e_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.2,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Что то произошло"));
          }
        },
      ),
    );
  }
}
