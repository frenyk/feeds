import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/features/authentication/screens/login_screen/login_screen.dart';

class Homepage_1 extends StatelessWidget {
  const Homepage_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homepage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Log out"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            });
          },
        ),
      ),
    );
  }
}
