import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/src/constants/text.dart';
import 'package:login_app/src/features/authentication/screens/login_screen/login_screen.dart';

// ignore: camel_case_types
class changePasswordScreen extends StatefulWidget {
  const changePasswordScreen({super.key});

  @override
  State<changePasswordScreen> createState() => _changePasswordScreenState();
}

// ignore: camel_case_types
class _changePasswordScreenState extends State<changePasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  var newPassword = "";
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Your password has been change..Login again!')));
    } catch (error) {}
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
                tChangePass,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                tChangepassSubTitle,
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
                    decoration: const InputDecoration(
                      label: Text(tNewPass),
                      hintText: tNewPass,
                      prefixIcon: Icon(Icons.fingerprint),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    height: 45.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            newPassword = newPasswordController.text;
                          });
                          changePassword();
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
