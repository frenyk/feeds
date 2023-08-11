import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/textfild.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text.dart';
import '../Forget_screen/forrgot_screen.dart';
import '../main Screen/menegment/menegment_homepage.dart';
import '../main Screen/student/home_student.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String role = '';

  void getData(User) async {
    var v1 = await FirebaseFirestore.instance
        .collection('user')
        .doc(User?.uid)
        .get();

    setState(() {
      role = v1.data()!['role'];
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReuseTextField(
                "Email", Icons.person_outline, false, _emailcontroller),
            const SizedBox(height: tFormHeight - 20),
            ReuseTextField(
                "Password", Icons.fingerprint, true, _passwordcontroller),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    forgetpass(context);
                  },
                  child: const Text(tForgetPassword)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                  User? user = await loginUsingEmailAndPassword(
                      _emailcontroller.text, _passwordcontroller.text, context);
                  getData(user);
                  if (user == null) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Password Incorrect."),
                          );
                        });
                  }
                  if (user != null &&
                      _emailcontroller.text == 'admin@gmail.com') {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Homepage_men()));
                  } else if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Homepagestudent()));
                  }
                },
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<User?> loginUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("user-not-found"),
              );
            });
      }
    }
    return user;
  }
}
