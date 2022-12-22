import 'package:chat_app/component/fixed_button.dart';
import 'package:chat_app/component/text_field.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    final authentication = FirebaseAuth.instance;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.mic,
                color: Colors.blue,
                size: 50,
              ),
              const Text(
                "Sign in \n Continue",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              FixedTextField(
                icon: Icons.email,
                label: "Enter your email",
                onChange: (v) {
                  email = v;
                  print(v);
                },
              ),
              FixedTextField(
                icon: Icons.lock,
                label: "Enter your password",
                onChange: (v) {
                  password = v;
                  print(v);
                },
              ),
              FixedButton(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await authentication.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  print(authentication.currentUser!.uid);
                  if (authentication.currentUser!.uid.isNotEmpty) {
                    prefs.setString("email", email!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("This user can not found"),
                    ));
                  }
                },
                label: "Login",
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
