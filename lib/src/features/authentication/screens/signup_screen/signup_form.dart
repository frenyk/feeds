import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/image_string.dart';
import 'package:login_app/src/features/authentication/controller/signupcontrol.dart';
import '../../../../common_widgets/textfild.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text.dart';
import '../main Screen/student/home_student.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    String num = '+91';
    Future signIn() async {}
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReuseTextField(tFullName, Icons.person_outline_rounded, false,
                controller.fullname),
            const SizedBox(height: tFormHeight - 20),
            ReuseTextField(
                tEmail, Icons.email_outlined, false, controller.email),
            const SizedBox(height: tFormHeight - 20),
            ReuseTextField(tPhoneNo, Icons.numbers, false, controller.phoneno),
            const SizedBox(height: tFormHeight - 20),
            ReuseTextField(
                tPassword, Icons.fingerprint, true, controller.password),
            const SizedBox(height: tFormHeight - 20),
            ReuseTextField(
                tHostelName, Icons.home, false, controller.hostelname),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  var currentUser = FirebaseAuth.instance.currentUser;
                  var email = controller.email;
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: controller.password.text,
                  )
                      .then((value) {
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(currentUser!.uid)
                        .set({
                      'username': controller.fullname.text.trim(),
                      'password': controller.password.text.trim(),
                      'email': controller.email.text.trim(),
                      'phone': controller.phoneno.text.trim(),
                      'hostelname': controller.hostelname.text.trim(),
                      'imgPath': '',
                      'id': currentUser.uid
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Homepagestudent())));
                  });
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
