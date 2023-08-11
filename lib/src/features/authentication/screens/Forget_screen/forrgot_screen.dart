import 'package:flutter/material.dart';

import '../../../../constants/text.dart';
import 'forget_pass_mail_screen.dart';
import 'forget_pass_phone_screen.dart';

void forgetpass(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  tForgetPasswordTitle,
                  style: TextStyle(fontSize: 35),
                ),
                const Text(
                  tForgetPasswordSubTitle,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const ForgetPasswordMailScreen())));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.mail_outline_sharp,
                          size: 60.0,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              tEmail,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              tResetViaEMail,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const ForgetPasswordphoneScreen())));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.mobile_friendly_outlined,
                          size: 60.0,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              tPhoneNo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              tResetViaPhone,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
}
