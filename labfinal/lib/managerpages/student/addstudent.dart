import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Method.dart';
class addstudent extends StatefulWidget {
  const addstudent({Key? key}) : super(key: key);

  @override
  _addstudentState createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  Stream<QuerySnapshot> subjectData()async*{
    final uid=await getuserid();
    yield* FirebaseFirestore.instance.collection('institution').doc(uid).collection('subject').snapshots();
  }
  TextEditingController name=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController subject=new TextEditingController();
  TextEditingController classes=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  bool isloading=false;
  var tsubject;

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
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Enter student Name',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: 'Enter student PhoneNo',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Enter student E-mail',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),
                  // Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: TextFormField(
                  //     controller: subject,
                  //     decoration: InputDecoration(
                  //       hintText: 'Enter student Subject',
                  //       hintStyle: TextStyle(color: Colors.blue),
                  //     ),
                  //   ),),
                  StreamBuilder<QuerySnapshot>(
                    stream: subjectData(),
                    builder: (context,AsyncSnapshot snapshot){
                      if(!snapshot.hasData){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Data not available",
                              hintStyle: TextStyle(color: Colors.blue.shade50),
                              prefixIcon: Icon(
                                Icons.class__outlined,
                                color: Colors.blue,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(width: 3, color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(width: 3, color: Colors.blue),
                              ),
                            ),
                          ),
                        );
                      }
                      else{
                        List<DropdownMenuItem>classname=[];
                        for(int i=0;i<snapshot.data.docs.length;i++){
                          DocumentSnapshot snap=snapshot.data.docs[i];
                          classname.add(
                            DropdownMenuItem(
                              child: Text(snap['subjectN'],style: TextStyle(color: Colors.blue,fontSize: 12),),
                              value: "${snap['subjectN']}",
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //       color: Colors.blue,
                            //       width: 1
                            //   ),
                            //   borderRadius: BorderRadius.circular(5),
                            //
                            // ),
                            child: Row(
                              children:[
                                Icon(Icons.class__outlined,color: Colors.blue,),
                                SizedBox(width: 20,),
                                DropdownButton<dynamic>(
                                  items: classname, onChanged: (subject){
                                  setState(() {
                                    tsubject=subject;
                                  });
                                },
                                  value: tsubject,
                                  hint: Text("Select subject",style: TextStyle(color: Colors.blue,fontSize: 12,),),


                                ),

                              ],
                            ),
                          ),
                        );

                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: classes,

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
                      controller: pass,

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
                            if(name.text.isNotEmpty&&phone.text.isNotEmpty&&email.text.isNotEmpty&&tsubject.toString().isNotEmpty&&classes.text.isNotEmpty&&pass.text.isNotEmpty)
                          {
                            setState(() {
                              isloading=true;
                            });
                            final uid=await getuserid();
                            await FirebaseFirestore.instance.collection('institution').doc(uid).collection('students').add({'name':name.text,'phone':phone.text,'email':email.text,'subject':tsubject.toString(),
                              'classes':classes.text,'passwpord':pass.text})
                                .then((value){
                                  print(value.id);
                                  setState(() {
                                  isloading=false;
                                  });
                                  name.clear();
                                  phone.clear();
                                  email.clear();
                                  subject.clear();
                                  classes.clear();
                                  pass.clear();
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
