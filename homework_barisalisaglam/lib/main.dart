import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/firebase_options.dart';
import 'package:homework_barisalisaglam/view/login_page.dart';
import 'package:homework_barisalisaglam/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
      ),
    );
  }
}
