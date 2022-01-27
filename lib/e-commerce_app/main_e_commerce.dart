import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_apps/e-commerce_app/blocs/category/category_bloc.dart';
import 'package:flutter_apps/e-commerce_app/blocs/product/product_bloc.dart';
import 'package:flutter_apps/e-commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_apps/e-commerce_app/config/app_router.dart';
import 'package:flutter_apps/e-commerce_app/repositories/category/category_repository.dart';
import 'package:flutter_apps/e-commerce_app/repositories/product/product_repository.dart';
import 'package:flutter_apps/e-commerce_app/screens/checkout/checkout.dart';
import 'package:flutter_apps/e-commerce_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppEcommerce());
}

class AppEcommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
      ],
      child: MaterialApp(
        title: "E-commerce",
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: CheckoutScreen.routeName,
        home: EHomeScreen(),
      ),
    );
  }
}
