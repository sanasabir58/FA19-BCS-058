import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpage.dart';

import 'Method.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _email= TextEditingController();
  TextEditingController _password=TextEditingController();
  TextEditingController _institute=TextEditingController();
  bool isloading=false;

  final _form = GlobalKey<FormState>();
  bool emailValidation(String e){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e);
    return emailValid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           height: 700.0,
           width: 700.0,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(
                   'images/f1.jpg'),
               fit: BoxFit.fill,
             ),
           ),
           child:Form(
             key: _form,
             child:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(height: 10.0,),
                 Center(
                   child: Text('SignUp Here!', style: TextStyle(
                       fontSize: 34.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.blue
                   ),),
                 ),
                 SizedBox(height: 5.0,),
                 Center(
                   child: Text('SignUp to Continue!', style: TextStyle(
                       fontSize: 14.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.blue
                   ),),
                 ),
                 SizedBox(height: 50.0,),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: TextFormField(
                     decoration: InputDecoration(
                       hintText: 'Enter Your Name',
                       hintStyle: TextStyle(color: Colors.blue),
                     ),),),
                 SizedBox(height: 20.0,),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: TextFormField(
                     controller: _institute,
                     decoration: InputDecoration(
                       hintText: 'Enter Institute Name',
                       hintStyle: TextStyle(color: Colors.blue),
                     ),),),
                 SizedBox(height: 20.0,),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: TextFormField(
                     decoration: InputDecoration(
                       hintText: 'Enter Your PhoneNo',
                       hintStyle: TextStyle(color: Colors.blue),
                     ),

                   ),),
                 SizedBox(height: 20.0,),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: TextFormField(
                     controller: _email,
                     validator:(value){
                       if(!emailValidation(value!)||value.isEmpty){
                         return "Please enter valid email adddress";
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                       hintText: 'Enter Your E-mail',
                       hintStyle: TextStyle(color: Colors.blue),
                     ),

                   ),),
                 SizedBox(height: 20.0,),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: TextFormField(
                     controller: _password,
                     validator: (value){
                       if(value!.isEmpty||value.length<7){
                         return "Please enter at least 7 character";
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                     hintText: 'Enter Your Password',
                     hintStyle: TextStyle(color: Colors.blue),
                   ),
                   ),),
                 SizedBox(
                   height: 20.0,
                 ),
                 Padding(
                   padding:const EdgeInsets.symmetric(horizontal: 100),
                   child:  AnimatedButton(
                     width: 150.0,
                     child: Text('SignUp',style: TextStyle(
                       fontSize: 22,
                       color: Colors.white,
                       fontWeight: FontWeight.w500,
                     ),),
                     color: Colors.blue,
                     onPressed: () {
                       if(!_form.currentState!.validate()){
                         return;
                       }
                       if(_form.currentState!.validate()){
                         setState(() {
                           isloading=true;
                         });
                         createAccount(_institute.text, _email.text.trim(), _password.text).then((user){
                           if(user!=null){
                             setState(() {
                               isloading=false;
                             });
                             print("Signup successfully");
                             _email.clear();
                             _password.clear();
                             _institute.clear();
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginpage()));
                             const snackBar = SnackBar(
                               content: Text('Create Account Successfully'),
                             );
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                           else{
                             print("signup failed");
                             setState(() {
                               isloading=false;
                             });
                           }
                         });
                       }
                       else{
                         print("Please enter feild");
                       };

                     },
                     enabled: true,
                     shadowDegree: ShadowDegree.dark,
                   ),),
                 SizedBox(
                   height: 20.0,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Already have an account?   "),
                     GestureDetector(
                       onTap: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginpage()));
                       },
                       child: Text("Login",
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
           )),
       ),
    );
  }
}
