import 'package:flutter/cupertino.dart';

import '../services/auth.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;

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
