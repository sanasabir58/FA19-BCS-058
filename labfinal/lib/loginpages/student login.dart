import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
class studentlogin extends StatefulWidget {
  const studentlogin({Key? key}) : super(key: key);

  @override
  _studentloginState createState() => _studentloginState();
}

class _studentloginState extends State<studentlogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5.0,),
              Center(
                child: Text('Login Here!',
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),),
              ),
              Center(
                child: Text('As Student You can Login Here!',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.lightBlueAccent,
                  ),),
              ),
              SizedBox(height: 60.0,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your E-mail',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),),
              SizedBox(height: 20.0,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),),
              SizedBox(height: 20.0,),
              Padding(padding:const EdgeInsets.symmetric(horizontal: 100),
                child:  AnimatedButton(
                  width: 150.0,
                  child: Text('login',style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
                  color: Colors.blue,
                  onPressed: () {},
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),),

            ],
          ),
        )
    );
  }
}
