
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';

class Wellocme extends StatelessWidget {
  const Wellocme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){logout(context);},
          child: Text("Logout"),
        ),
      ),
    );
  }
}
