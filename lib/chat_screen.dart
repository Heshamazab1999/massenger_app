import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, this.id, this.name}) : super(key: key);
  final String? id;
  final String? name;

  @override
  Widget build(BuildContext context) {
    print(id);
    print(name);
    final store = FirebaseFirestore.instance;
    String? message;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Material(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(1)),
            child: Text(
                "datadatadatadatadatadata\n ContinueContinueContinueContinueContinue    "),
          ),
          TextField(
            onChanged: (value) {
              message = value;
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await store
                        .collection("user")
                        .doc(id)
                        .collection("chat")
                        .add({
                      "message": message,
                      "receiver": name,
                      "sender": prefs.get("email")
                    });
                    // await store.collection("chat").add({"message": message});
                  },
                  icon: const Icon(Icons.send, color: Colors.teal, size: 35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          )
        ],
      ),
    );
  }
}
