import 'package:flutter/material.dart';
import 'inputpage.dart';
void main(){
  runApp(bmicalculator(),);
}
class bmicalculator extends StatelessWidget {
  const bmicalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            primaryColor: Color(0xFF0A0E21),
          ),
    );
  }
}


