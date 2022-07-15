import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Method.dart';
class addnotification extends StatefulWidget {
  const addnotification({Key? key}) : super(key: key);

  @override
  _addnotificationState createState() => _addnotificationState();
}

class _addnotificationState extends State<addnotification> {
  // Stream<QuerySnapshot> getClassData()async*{
  //   final uid=await getuserid();
  //   yield* FirebaseFirestore.instance.collection('institution').doc(uid).collection('classes').snapshots();
  // }
  TextEditingController title=new TextEditingController();
  TextEditingController body=new TextEditingController();
  // TextEditingController email=new TextEditingController();
  // TextEditingController subject=new TextEditingController();
  // TextEditingController pass=new TextEditingController();
  // TextEditingController classes=new TextEditingController();
  bool isloading=false;
  // var tclasses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Notification',
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
                       controller: title,
                      decoration: InputDecoration(
                        hintText: 'Enter title',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),),),
                  SizedBox(height: 20.0,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                       controller: body,
                      decoration: InputDecoration(
                        hintText: 'Enter Body ',
                        hintStyle: TextStyle(color: Colors.blue),
                      ),

                    ),),
                  SizedBox(height: 20.0,),


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
                        if(title.text.isNotEmpty&&body.text.isNotEmpty)
                        {
                          setState(() {
                            isloading=true;
                          });
                          final uid=await getuserid();
                          await FirebaseFirestore.instance.collection('notification').add({'title':title.text,'body':body.text,})
                              .then((value) {
                            print(value.id);
                            setState(() {
                              isloading=false;
                            });
                            title.clear();
                            body.clear();
                            const snackBar = SnackBar(
                              content: Text('send notification'),
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
                    ),),
                ],
              ),
            ),),
      ),
    );
  }
}
