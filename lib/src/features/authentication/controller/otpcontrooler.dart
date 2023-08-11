import 'package:get/get.dart';
import 'package:login_app/src/exception/authentical_res.dart';
import 'package:login_app/src/features/authentication/screens/welcome_screen.dart';

import '../screens/Homepage.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const WelcomeScreen()) : Get.back();
  }
}
