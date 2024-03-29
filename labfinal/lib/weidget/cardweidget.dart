import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Method.dart';
class customcard extends StatelessWidget {

  customcard({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docId=snapshot.docs[index].id;
    TextEditingController tname=new TextEditingController(text: snapshot.docs[index]['name']);
    TextEditingController phone=new TextEditingController(text: snapshot.docs[index]['phone']);
    TextEditingController email=new TextEditingController(text: snapshot.docs[index]['email']);
    TextEditingController subject=new TextEditingController(text: snapshot.docs[index]['subject']);
    TextEditingController classes=new TextEditingController(text: snapshot.docs[index]['classes']);
    TextEditingController pass=new TextEditingController(text: snapshot.docs[index]['passwpord']);
    return Card(
      margin: EdgeInsets.only(top:10.0),
      color:Colors.lightBlue.shade50 ,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              radius: 25.0,
              child: Text("${snapshot.docs[index]['name'][0]}",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${snapshot.docs[index]['name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("phone: ${snapshot.docs[index]['phone']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("Email: ${snapshot.docs[index]['email']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("subject: ${snapshot.docs[index]['subject']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("class: ${snapshot.docs[index]['classes']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("password: ${snapshot.docs[index]['passwpord']}",
                      style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              IconButton(
                onPressed: ()async{
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Update'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: tname,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: phone,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: subject,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.subject,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: classes,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.class__outlined,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: pass,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.password,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),

                        actions: [
                          TextButton(
                            onPressed: () async {
                              if(tname.text.isNotEmpty&&phone.text.isNotEmpty&&email.text.isNotEmpty&&subject.text.isNotEmpty&&classes.text.isNotEmpty&&
                              pass.text.isNotEmpty)
                                {
                                  final uid=await getuserid();
                                  FirebaseFirestore.instance.collection('institution').doc(uid).collection("teacher").doc(docId).update({"name":tname.text,"phone":phone.text,"email":email.text,"subject":subject.text,"classes":classes.text,
                                    "passwpord":pass.text,
                                  }).then((value) {
                                    Navigator.pop(context);
                                  });
                                }
                            },
                            child: Text('Update', style: TextStyle(color: Colors.pink),),
                          ),
                          TextButton(
                            onPressed: (){

                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel', style: TextStyle(color: Colors.blue),),
                          ),
                        ],
                      );
                    },
                  );
                }, icon: Icon(
                Icons.edit,
                color: Colors.green,
              ),),
              IconButton(onPressed: () {
                showDialog(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('Are You sure!'),
                      actions: [
                        TextButton(onPressed: () async {
                          Navigator.of(context).pop();
                          final uid=await getuserid();
                          var FirebaseReference=FirebaseFirestore.instance.collection('institution').doc(uid).collection('teacher');
                          await FirebaseReference.doc(docId).delete();
                        },
                          child: Text('Yes',style: TextStyle(color: Colors.pink),),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text('No',style: TextStyle(color: Colors.blue),),
                        ),
                      ],

                    );
                  },
                );
              },
                icon: Icon(
                  Icons.delete,
                  color: Colors.pink,
                ),),
            ],
          )
          ],
      ),

    );
  }
}
