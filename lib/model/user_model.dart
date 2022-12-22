import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  String? key;

  UserModel({this.email, this.password});

  UserModel.fromJson(DocumentSnapshot snapshot) {
    email = snapshot["email"];
    password = snapshot["password"];
    key = snapshot.id;
  }
}
