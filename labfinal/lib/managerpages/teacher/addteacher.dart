import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/loginpage.dart';
class addteacher extends StatefulWidget {
  const addteacher({Key? key}) : super(key: key);

  @override
  _addteacherState createState() => _addteacherState();
}

class _addteacherState extends State<addteacher> {
  TextEditingController name=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController subject=new TextEditingController();
  TextEditingController classes=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  bool isloading=false;

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
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Enter Teacher Name',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: 'Enter teacher PhoneNo',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Enter teacher E-mail',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: subject,
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
                      controller: classes,
                      decoration: InputDecoration(
                        hintText: 'Enter teacher Class',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: pass,
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
                        if(name.text.isNotEmpty&&phone.text.isNotEmpty&&email.text.isNotEmpty&&subject.text.isNotEmpty&&classes.text.isNotEmpty&&pass.text)
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
