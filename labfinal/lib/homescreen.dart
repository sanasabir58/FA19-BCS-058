import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpage.dart';
import 'package:labfinal/loginpages/student%20login.dart';
import 'package:labfinal/loginpages/teacherlogin.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Fees Management App',
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
          children: [
            SizedBox(
              height: 55.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  height: 150.0,
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/m1.png'),height: 100.0),
                      SizedBox(width: 0.5,
                        height: 0.5,
                      ),
                      Text(
                        'For Manager',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  color: Colors.lightBlue.shade50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),
                // AnimatedButton(
                //   height: 110.0,
                //   width: 320.0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.person_outline,color: Colors.white,size: 50.0,),
                //       SizedBox(width: 30.0),
                //       Text(
                //         'For Manager',
                //         style: TextStyle(
                //           fontSize: 22,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w500,),),
                //     ],
                //   ),
                //   color: Colors.blue,
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                //   },
                //   enabled: true,
                //   shadowDegree: ShadowDegree.dark,
                // ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  height: 150.0,
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/s1.png'),
                          height: 100.0),
                      SizedBox(width: 0.5,
                      height: 0.5),
                      Text(
                        'For teacher',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  color: Colors.blue.shade50,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),
                // AnimatedButton(
                //   height: 110.0,
                //   width: 320.0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.person,color: Colors.white,size: 50.0,),
                //       SizedBox(width: 30.0),
                //       Text(
                //         'For Teacher',
                //         style: TextStyle(
                //           fontSize: 22,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                //   color: Colors.blue,
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherlogin()));
                //   },
                //   enabled: true,
                //   shadowDegree: ShadowDegree.dark,
                // ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  height: 150.0,
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/tt1.png'),height: 100.0),
                      SizedBox(width: 0.5,
                      height: 0.5),
                      Text(
                        'For Student',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  color: Colors.blue.shade50,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),
                // AnimatedButton(
                //   height: 110.0,
                //   width: 320.0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.person,color: Colors.white,size: 50.0,),
                //       SizedBox(width: 30.0),
                //       Text(
                //         'For Student',
                //         style: TextStyle(
                //           fontSize: 22,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                //   color: Colors.blue,
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>studentlogin()));
                //   },
                //   enabled: true,
                //   shadowDegree: ShadowDegree.dark,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
