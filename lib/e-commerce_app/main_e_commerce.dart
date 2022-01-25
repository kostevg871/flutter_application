import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_apps/e-commerce_app/config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme.dart';
import 'screens/home/e_home_page.dart';

void main() {
  runApp(AppEcommerce());
}

class AppEcommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
      ],
      child: MaterialApp(
        title: "E-commerce",
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: EHomeScreen.routeName,
        home: EHomeScreen(),
      ),
    );
  }
}