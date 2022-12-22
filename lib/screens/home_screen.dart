import 'package:chat_app/chat_screen.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final store = FirebaseFirestore.instance;
  final List<UserModel> listOfUser = [];

  Future<List<UserModel>> get() async {
    final data = await store.collection("user").get();
    return data.docs.map((e) => UserModel.fromJson(e)).toList();
  }

  convert() async {
    listOfUser.addAll(await get());
    print(listOfUser);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     convert();
  //   });
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      convert();

    });

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            listOfUser.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfUser.length,
                    itemBuilder: (_, index) => ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          name: listOfUser[index].email,
                                          id: listOfUser[index].key,
                                        )));
                          },
                          title: Text(listOfUser[index].email!),
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue,
                          ),
                        ))
          ],
        ),
      ),
    ));
  }
}
