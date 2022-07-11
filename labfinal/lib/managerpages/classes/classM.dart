import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/managerpages/classes/addclass.dart';
import 'package:labfinal/managerpages/classes/viewclass.dart';
class classM extends StatefulWidget {
  const classM({Key? key}) : super(key: key);

  @override
  _classMState createState() => _classMState();
}

class _classMState extends State<classM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Classes',
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
                    'Add Class',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>addclass()));
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
                    'View Classes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,),),
                ],
              ),
              color: Colors.white,
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>viewclass()));
              },
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),

          ],
        ) ,
      )
    );
  }
}
