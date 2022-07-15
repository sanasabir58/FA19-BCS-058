import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:labfinal/maintain%20subject/add%20subject.dart';
import 'package:labfinal/maintain%20subject/view%20subject.dart';


class subject extends StatefulWidget {
  const subject({Key? key}) : super(key: key);

  @override
  _subjectState createState() => _subjectState();
}

class _subjectState extends State<subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Subject Record',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              height: 200.0,
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/ss2.png'),
                      height: 100.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Add subject',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>addsubject()));
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
                  Image(image: AssetImage('images/ss1.png'),
                      height: 100.0),
                  SizedBox(width: 10.0),
                  Text(
                    'view subject',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewsubject()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
          ],
        ),
      ),
    );
  }
}
