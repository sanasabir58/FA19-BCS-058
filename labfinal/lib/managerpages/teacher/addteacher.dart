import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpage.dart';
class addteacher extends StatefulWidget {
  const addteacher({Key? key}) : super(key: key);

  @override
  _addteacherState createState() => _addteacherState();
}

class _addteacherState extends State<addteacher> {
  // TextEditingController _email= TextEditingController();
  // TextEditingController _password=TextEditingController();
  // final _form = GlobalKey<FormState>();
  // bool emailValidation(String e){
  //   bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e);
  //   return emailValid;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Teacher Record',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
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
              // key: _form,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Teacher Name',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter teacher PhoneNo',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      // controller: _email,
                      // validator:(value){
                      //   if(!emailValidation(value!)||value.isEmpty){
                      //     return "Please enter valid email adddress";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        hintText: 'Enter teacher E-mail',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      // controller: _password,
                      // validator: (value){
                      //   if(value!.isEmpty||value.length<7){
                      //     return "Please enter at least 7 character";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        hintText: 'Enter teacher Subject',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      // controller: _password,
                      // validator: (value){
                      //   if(value!.isEmpty||value.length<7){
                      //     return "Please enter at least 7 character";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        hintText: 'Select teacher Classes',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      // controller: _password,
                      // validator: (value){
                      //   if(value!.isEmpty||value.length<7){
                      //     return "Please enter at least 7 character";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        hintText: 'Enter Password for teacher',
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
                      child: Text('Add',style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),),
                      color: Colors.blue,
                      onPressed: () {
                        // if(!_form.currentState!.validate()){
                        //   return;
                        // }

                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginpage()));
                      },
                      enabled: true,
                      shadowDegree: ShadowDegree.dark,
                    ),),
                ],
              ),
            )),
      ),
    );
  }
}
