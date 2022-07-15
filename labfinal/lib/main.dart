import 'package:animated_button/animated_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpage.dart';
import 'package:labfinal/loginpages/student%20login.dart';
import 'package:labfinal/loginpages/teacherlogin.dart';
import 'package:labfinal/managerpages/classes/addclass.dart';
import 'package:labfinal/splash.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp(),
  );
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
