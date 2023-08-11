import 'package:flutter/material.dart';
import 'package:login_app/src/utils/themes/text_theme.dart';
import '../../../../constants/text.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tSignUpTitle, style: Headertext),
        Text(tSignUpSubTitle, style: HeaderSubtext),
      ],
    );
  }
}
