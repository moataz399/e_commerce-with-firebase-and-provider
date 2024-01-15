import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar_page.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/login_page.dart';
import 'package:e_commerce/views/pages/product_details.dart';
import 'package:e_commerce/views/pages/register_page.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPage:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
    case AppRoutes.productDetails:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => ProductDetails(
          product: product,
        ),
      );

    case AppRoutes.loginPage:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const LoginPage(),
      );
    case AppRoutes.signUpPage:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const RegisterPage(),
      );

    case AppRoutes.bottomNavBar:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const BottomNavBarPage(),
      );

    default:
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('NO route defined to ${settings.name}'),
                ),
              ));
  }
}

class AppRouter {}
