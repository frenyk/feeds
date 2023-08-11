import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/constants/text.dart';
import 'package:login_app/src/features/authentication/screens/login_screen/login_screen.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordRest() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link send! check your email.'),
            );
          });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 200.0,
              ),
              const Text(
                'Forget Password',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                tForgetMailSubTitle,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text(tEmail),
                      hintText: tEmail,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                      height: 45.0,
                      width: double.infinity,
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: passwordRest,
                        child: const Text(
                          tNext,
                          style: TextStyle(fontSize: 15),
                        ),
                      ))
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
