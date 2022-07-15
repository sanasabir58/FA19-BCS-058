import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/managerpages/student/addstudent.dart';
import 'package:labfinal/managerpages/student/viewstudent.dart';

import 'assign subject.dart';
class studentM extends StatelessWidget {
  const studentM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Record',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              height: 160.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/ss2.png'),height: 100),
                  SizedBox(width: 10.0),
                  Text(
                    'Add Student',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>addstudent()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 160.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/ss1.png'),height: 100),
                  SizedBox(width: 10.0),
                  Text(
                    'View Student \n Record',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewstudent()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 160.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/t1.png'),height: 100),
                  SizedBox(width: 10.0),
                  Text(
                    'Assign Student Subject',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>addsubStudent()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),

          ],
        ) ,
      ),
    );
  }
}
