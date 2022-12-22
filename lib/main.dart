import 'package:chat_app/login_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Car {
  Car({String? name}) {}
//constructor default parameters named parameters
//fields string int double
//encapsulation setter getter
// function

}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  var email = prefs.get("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email != null ? const HomeScreen() : const LoginScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
