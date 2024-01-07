import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view/main_page.dart';
import 'package:homework_barisalisaglam/view/register_page.dart';
import 'package:homework_barisalisaglam/view_model/main_view_model.dart';
import 'package:homework_barisalisaglam/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void login(BuildContext context, email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
    void _openMainPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: MainPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
