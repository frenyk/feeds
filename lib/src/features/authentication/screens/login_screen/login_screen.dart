import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/screens/auth_service.dart';

import 'Login_Form.dart';
import 'Login_Header_Widget.dart';
import 'login_footer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 130, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
