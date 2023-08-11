
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/exception/authentical_res.dart';
import 'package:login_app/src/features/authentication/screens/main%20Screen/menegment/menegment_homepage.dart';
import 'package:login_app/src/features/authentication/screens/main%20Screen/student/home_student.dart';
import 'package:login_app/src/features/authentication/screens/splash_screen.dart';
import 'package:login_app/src/features/authentication/screens/welcome_screen.dart';
import 'package:login_app/src/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
    '/studentPage': (context) => Homepagestudent(),
    '/menpage': (context) => Homepage_men(),
    // ...
  },
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}


