import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_string.dart';
import 'auth.dart';
import 'main Screen/student/home_student.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();

  static void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Homepagestudent())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen())));
    }
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   const Duration(seconds: 5, milliseconds: 54),
    //   () => Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginAuthPage(),
    //     ),
    //   ),
    // );
    SplashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(SplashImage),
                width: 150,
              ),
              SizedBox(
                height: 20.0,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ],
    );
  }
}
