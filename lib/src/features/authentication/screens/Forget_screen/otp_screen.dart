import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/src/constants/text.dart';
import 'package:login_app/src/features/authentication/screens/Homepage.dart';
import 'package:login_app/src/features/authentication/screens/welcome_screen.dart';

import 'forget_pass_phone_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOTPTitle,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(
              tOTPSubTitle.toUpperCase(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              tOTPMessege,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              // ignore: non_constant_identifier_names
              onSubmit: (Code) {
                otp = Code;
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: ForgetPasswordphoneScreen.verify,
                            smsCode: otp);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (route) => false);
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text("Invalid otp"),
                          );
                        });
                  }
                },
                child: const Text(tNext),
              ),
            )
          ],
        ),
      ),
    );
  }
}
