import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:login_app/src/features/authentication/screens/main%20Screen/student/home_student.dart';
import 'package:login_app/src/features/authentication/screens/welcome_screen.dart';

import '../features/authentication/screens/Homepage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseuser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseuser = Rx<User?>(_auth.currentUser);
    firebaseuser.bindStream(_auth.userChanges());
    ever(firebaseuser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Homepagestudent())
        : Get.offAll(() => WelcomeScreen());
  }

  void phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (Credential) async {
          await _auth.signInWithCredential(Credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar('Error', 'Something want wrong. Try again.');
          }
        },
        codeSent: ((verificationId, resendToken) {
          this.verificationId.value = verificationId;
        }),
        codeAutoRetrievalTimeout: ((verificationId) {
          this.verificationId.value = verificationId;
        }));
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseuser.value != null
          ? Get.offAll(() => Homepagestudent())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
