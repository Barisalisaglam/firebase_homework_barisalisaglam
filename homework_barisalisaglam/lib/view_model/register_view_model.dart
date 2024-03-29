import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view/login_page.dart';
import 'package:homework_barisalisaglam/view/main_page.dart';
import 'package:homework_barisalisaglam/view_model/login_view_model.dart';
import 'package:homework_barisalisaglam/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class RegisterViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void register(BuildContext context, email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
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
