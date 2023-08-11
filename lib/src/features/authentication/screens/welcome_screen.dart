import 'package:flutter/material.dart';
import 'package:login_app/src/features/authentication/screens/login_screen/login_screen.dart';

import '../../../constants/image_string.dart';
import 'login_screen/login_screen_menegment.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage(welcomephoto), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(240, 72, 18, 68),
                  ),
                  child: Text(
                    'Student',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(240, 72, 18, 68),
                  ),
                  child: Text(
                    'Manager',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreenMenegment())),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    )
        //     Column(
        //   children: [
        //     const Image(
        //       image: AssetImage(welcomephoto),
        //       height: 700,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         SizedBox(
        //           width: 150,
        //           height: 50,
        //           child: ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               primary: Color.fromARGB(154, 72, 18, 68),
        //             ),
        //             child: Text(
        //               'Student',
        //               style: TextStyle(fontSize: 20),
        //             ),
        //             onPressed: () => Navigator.pushReplacement(context,
        //                 MaterialPageRoute(builder: (context) => LoginScreen())),
        //           ),
        //         ),

        //       ],
        //     )
        //   ],

        );
  }
}
