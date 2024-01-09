import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/login_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {



    case AppRoutes.landingPage:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );

    case AppRoutes.loginPage:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );


    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('NO route defined to ${settings.name}'),
                ),
              ));
  }
}

class AppRouter {}
