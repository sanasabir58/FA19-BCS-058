import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/notification/add%20notification.dart';
import 'package:labfinal/notification/view%20notification.dart';
class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Notification',
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
              height: 200.0,
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/t1.png'),),
                  SizedBox(width: 10.0),
                  Text(
                    'Add Notification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>addnotification()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            SizedBox(height: 10.0,),
            AnimatedButton(
              height: 200.0,
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/t1.png'),),
                  SizedBox(width: 10.0),
                  Text(
                    'View Notification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>viewnotification()));
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
