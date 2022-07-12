import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class addstudent extends StatefulWidget {
  const addstudent({Key? key}) : super(key: key);

  @override
  _addstudentState createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  TextEditingController sname=new TextEditingController();
  TextEditingController sphone=new TextEditingController();
  TextEditingController semail=new TextEditingController();
  TextEditingController ssubject=new TextEditingController();
  TextEditingController sclasses=new TextEditingController();
  TextEditingController spass=new TextEditingController();
  TextEditingController tname=new TextEditingController();
  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add student Record',
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
                      controller: sname,
                      decoration: InputDecoration(
                        hintText: 'Enter student Name',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: sphone,
                      decoration: InputDecoration(
                        hintText: 'Enter student PhoneNo',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: semail,
                      decoration: InputDecoration(
                        hintText: 'Enter student E-mail',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: ssubject,
                      decoration: InputDecoration(
                        hintText: 'Enter student Subject',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: sclasses,

                      decoration: InputDecoration(
                        hintText: 'Select student Class',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: tname,

                      decoration: InputDecoration(
                        hintText: 'Enter teacher name',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: spass,

                      decoration: InputDecoration(
                        hintText: 'Enter Password for student',
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
                      onPressed: () async {
                            if(sname.text.isNotEmpty&&sphone.text.isNotEmpty&&semail.text.isNotEmpty&&ssubject.text.isNotEmpty&&sclasses.text.isNotEmpty&&spass.text.isNotEmpty)
                          {
                            setState(() {
                              isloading=true;
                            });
                            await FirebaseFirestore.instance.collection('students').add({'name':sname.text,'phone':sphone.text,'email':semail.text,'subject':ssubject.text,
                              'classes':sclasses.text,'passwpord':spass.text})
                                .then((value){
                                  print(value.id);
                                  setState(() {
                                  isloading=false;
                                  });
                                  sname.clear();
                                  sphone.clear();
                                  semail.clear();
                                  ssubject.clear();
                                  sclasses.clear();
                                  spass.clear();
                                  const snackBar = SnackBar(
                                    content: Text('Data Save Successfully'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }).catchError((error){
                              print(error);
                            });
                          }
                            else{
                              const snackBar = SnackBar(
                                content: Text('Please fill all feild'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            }
                          },

                      enabled: true,
                      shadowDegree: ShadowDegree.dark,
                           ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
