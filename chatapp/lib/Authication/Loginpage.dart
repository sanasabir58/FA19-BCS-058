import 'package:chatapp/Authication/creataccount.dart';
import 'package:chatapp/Authication/method.dart';
import 'package:chatapp/Authication/welcomepage.dart';
import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool isloading=false;
  bool passvisibilty=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: isloading?Center(child: CircularProgressIndicator(),):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text('Wellcome',style: TextStyle(
                  fontSize: 34,
                   color: Colors.blue,
                   fontWeight: FontWeight.bold,
                ),),
              ),
              Center(
                child: Text('Sign In to Continue!',style: TextStyle(
                   color: Colors.blue.shade200,
                  fontWeight: FontWeight.w500,
                   fontSize: 25,
                ),),
              ),
              SizedBox(
                height:10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 18),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'E-mail',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: password,
                  obscureText: passvisibilty,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          passvisibilty=!passvisibilty;
                        });
                      },
                      icon: Icon(passvisibilty?Icons.visibility:Icons.visibility_off),
                    ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: ElevatedButton(onPressed: (){
                  if(email.text.isNotEmpty&&password.text.isNotEmpty)
                    {
                      setState(() {
                        isloading=true;
                      });
                      loginuser(email.text.trim(), password.text).then((user){
                        if(user!=null){
                          print('login sucessfully');
                          setState(() {
                            isloading=false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>welcomepage()));
                        }else{
                          print('login failed');
                          setState(() {
                            isloading=false;
                          });

                        }
                      });
                    }
                  else{
                    print('please fill correct info');
                  }
                }, child:
                Text('Login',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>createaccount()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account? "),
                      Text('Sign up',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),),],
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fitHeight
                  )
                ),
              ),

            ],
          ),

      )
    );
  }
}
