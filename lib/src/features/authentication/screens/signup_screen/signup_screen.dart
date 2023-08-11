import 'package:flutter/material.dart';
import 'SignUp_Footer.dart';
import 'Signup_Header.dart';
import 'signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Column(
              children:  [
                SignUpHeader(),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
