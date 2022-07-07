import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/managerpages/studentmaintain.dart';
import 'package:labfinal/managerpages/teachermaintain.dart';
class managerdashB extends StatelessWidget {
  const managerdashB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('DashBoard',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              height: 70.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_alt_rounded,color: Colors.white,size: 50.0,),
                  SizedBox(width: 10.0),
                  Text(
                    'Maintain Teacher \nRecord',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherM()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 70.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_alt_outlined,color: Colors.white,size: 50.0,),
                  SizedBox(width: 10.0),
                  Text(
                    'Maintain Student\nRecord',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>studentM()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 70.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dynamic_feed_sharp,color: Colors.white,size: 50.0,),
                  SizedBox(width: 15.0),
                  Text(
                    'Maintain fees Record',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlue,
              onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>studentM()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 70.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.subject,color: Colors.white,size: 50.0,),
                  SizedBox(width: 25.0),
                  Text(
                    'Maintain Subjects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 70.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.class__outlined,color: Colors.white,size: 50.0,),
                  SizedBox(width: 30.0),
                  Text(
                    'Maintain Classes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 70.0,
              width: 220.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.doorbell,color: Colors.white,size: 50.0,),
                  SizedBox(width: 10.0),
                  Text(
                    'Notification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
            ),

          ],
        ),
      ),
    );
  }
}

