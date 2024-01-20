import 'package:e_commerce/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../services/auth.dart';
import 'database_controller.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  final database = FireStoreDatabase("123");

  String email;
  String password;

  AuthController({required this.auth, this.email = "", this.password = ""});

  Future<void> submitLogin(
      {required String email, required String password}) async {
    try {
      await auth.loginWithEmailAndPassword(email, password);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> submitRegister(
      {required String email, required String password}) async {
    try {
      await auth.signUpWithEmailAndPassword(email, password);
      await database.setUserData(UserData(uId: auth.currentUser!.uid, email: email));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({String? email, String? password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    notifyListeners();
  }
}
