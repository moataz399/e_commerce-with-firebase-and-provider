import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/utils/arguments/add_shipping_address_args.dart';
import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar_page.dart';
import 'package:e_commerce/views/pages/checkout_page.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/login_page.dart';
import 'package:e_commerce/views/pages/product_details.dart';
import 'package:e_commerce/views/pages/register_page.dart';
import 'package:e_commerce/views/pages/add_shipping_address_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/pages/shipping_address_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    ///////////////
    case Routes.landingPage:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );

    ///////////////////////////////

    case Routes.addShippingAddressPage:
      final args = settings.arguments as AddShippingAddressArgs;
      final shippingAddress = args.shippingAddress;
      final database = args.database;
      return MaterialPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database,
            child: AddShippingAddressPage(
              shippingAddress: shippingAddress,
            )),
        settings: settings,
      );

    ////////////////////////////////
    case Routes.productDetails:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args["product"];
      final database = args["database"];
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(
            product: product,
          ),
        ),
      );

    case Routes.loginPage:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const LoginPage(),
      );
    case Routes.shippingAddressesPage:
      final database = settings.arguments as Database;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Provider<Database>.value(
            value: database, child: const ShippingAddressesPage()),
      );
    case Routes.checkOutPage:
      final database = settings.arguments as Database;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Provider<Database>.value(
            value: database, child: const CheckOutPage()),
      );
    case Routes.signUpPage:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const RegisterPage(),
      );

    case Routes.bottomNavBar:
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
