import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'CheckUser.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: CheckUser(),
        duration: 5000,
        imageSize: 130,
        imageSrc: "images/t1.png",
        text: "Fees Management App",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
            fontSize: 30.0,
            color: Colors.blue
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}