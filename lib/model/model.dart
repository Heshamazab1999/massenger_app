import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  String? email;
  String? password;

  Model({this.email, this.password});

  Model.fromJson(DocumentSnapshot snapshot) {
    email = snapshot["email"];
    password = snapshot["password"];
  }

  toJson() {
    final map = {};
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}
