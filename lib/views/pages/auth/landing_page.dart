import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/pages/auth/login_page.dart';
import 'package:e_commerce/views/pages/bottom_navbar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/database_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthController>(
                create: (context) => AuthController(auth: auth),
                child: const LoginPage());
          }
          return ChangeNotifierProvider<AuthController>(
            create: (context) => AuthController(auth: auth),
            child: Provider<Database>(
                create: (_) => FireStoreDatabase(user.uid),
                child: const BottomNavBarPage()),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
