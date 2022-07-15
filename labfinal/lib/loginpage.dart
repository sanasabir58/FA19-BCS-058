import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpages/resetpassword.dart';
import 'package:labfinal/managerpages/managerdashboard.dart';
import 'package:labfinal/signup.dart';

import 'Method.dart';
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController email= TextEditingController();
  TextEditingController password=TextEditingController();
  bool isloading=false;

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
            SizedBox(height: 60.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter Your E-mail',
                  hintStyle: TextStyle(color: Colors.blue),
                ),
              ),),
            SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: password,
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
                onPressed: () {
                  if(email.text.isNotEmpty&&password.text.isNotEmpty){
                    setState(() {
                      isloading=true;
                    });
                    Loginuser(email.text.trim(), password.text).then((user){
                      if(user!=null){
                        print("Login Successfully");
                        setState(() {
                          isloading=false;
                          email.clear();
                          password.clear();
                        });

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>managerdashB()));


                      }else{
                        print("Login Failed");
                        setState(() {
                          isloading=false;
                        });
                      }
                    } );
                  }else{
                    print("Please fill corrent information");
                  }
                },
                enabled: true,
                shadowDegree: ShadowDegree.dark,
              ),),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>resetpassword()));
                    },
                    child:Text('Forget Password?',style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16.0,


                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?   "),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup()));
                  },
                  child: Text("Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color:Colors.blue
                    ),
                  ),),
              ],
            ),


          ],
        ),
      )
    );
  }
}
