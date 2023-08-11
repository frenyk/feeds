import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/src/features/authentication/screens/main%20Screen/student/home_student.dart';
import 'package:login_app/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:login_app/src/constants/image_string.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text.dart';

class LoginFooterWidget extends StatelessWidget {
  LoginFooterWidget({
    Key? key,
  }) : super(key: key);
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(googlelogo), width: 20.0),
            onPressed: () async {
              try {
                await _googleSignIn.signIn().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepagestudent())));
              } catch (error) {
                print(error);
              }
            },
            label: Text(tSignInWithGoogle.toUpperCase(),
                style: const TextStyle(fontSize: 15)),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const SignUpScreen()),
              ),
            );
          },
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }

  // Future<void> signupwithgoogle() async {
  //   final GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try{
  //     GoogleSignInAccount? account =await _googleSignIn.signIn();
  //     if(account != null){
  //       final _gAuthentication = await account.authentication;
  //       final _credential = GoogleAuthProvider.credential(
  //         idToken: _gAuthentication.idToken,
  //         accessToken: _gAuthentication.accessToken);
  //        // await _auth.signInWithCredential(_credential);
  //        await saveUser(account);
  //        navigatorToHome();
  //     }
  //   }
  // }
}
