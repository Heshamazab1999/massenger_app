import 'package:chat_app/component/fixed_button.dart';
import 'package:chat_app/component/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    final auth = FirebaseAuth.instance;
    final store = FirebaseFirestore.instance;
    TextEditingController? editingController;
    TextEditingController? passwordController;
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
                "SignUp \n Continue",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              FixedTextField(
                textEditingController: editingController,
                icon: Icons.email,
                label: "Enter your email",
                onChange: (v) {
                  email = v;
                  print(email);
                },
              ),
              FixedTextField(
                textEditingController: passwordController,
                icon: Icons.lock,
                label: "Enter your password",
                onChange: (v) {
                  password = v;
                  print(password);
                },
              ),
              FixedButton(
                onTap: () async {
                  try {
                    await auth
                        .createUserWithEmailAndPassword(
                            email: email!, password: password!)
                        .then((value) {
                      store
                          .collection("user")
                          .add({"email": email, "password": password});
                    });
                  } catch (e) {}
                },
                label: "SignUp",
              )
            ],
          ),
        ),
      ),
    );
  }
}
