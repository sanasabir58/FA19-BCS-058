import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/managerpages/fees/add%20fee.dart';
import 'package:labfinal/managerpages/fees/view%20fee.dart';

class fees extends StatefulWidget {
  const fees({Key? key}) : super(key: key);

  @override
  _feesState createState() => _feesState();
}

class _feesState extends State<fees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Fee Record',
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
                    Image(image: AssetImage('images/f1.png'),
                    height: 100.0),
                    SizedBox(width: 10.0),
                    Text(
                      'Add fees',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,),),
                  ],
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>feesadd()));
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
                    Image(image: AssetImage('images/f2.png'),
                    height: 100.0),
                    SizedBox(width: 10.0),
                    Text(
                      'view fees',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,),),
                  ],
                ),
                color: Colors.white,
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>viewfee()));
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
