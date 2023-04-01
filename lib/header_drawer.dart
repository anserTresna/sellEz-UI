import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth
    //     .instance.currentUser; // Mengambil data user yang sedang login
    // String name = user != null
    //     ? user.displayName ?? ""
    //     : ""; // Mengambil nama user yang sedang login

    return Container(
      color: Colors.blue[600],
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              // image: DecorationImage(
              //   image: AssetImage('assets/img/man.png'),
              // ),
            ),
          ),
          // Text(
          //   // name,
          //   // style: const TextStyle(color: Colors.white, fontSize: 20),
          // ),
        ],
      ),
    );
  }
}
