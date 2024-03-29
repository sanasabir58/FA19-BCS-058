import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class simplepassword extends StatefulWidget {
  const simplepassword({Key? key}) : super(key: key);

  @override
  _simplepasswordState createState() => _simplepasswordState();
}

class _simplepasswordState extends State<simplepassword> {
  TextEditingController text=new TextEditingController();
  String generatepassword(){
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    const number = '1234567890';
    String char;
    String num;
    Random random = Random();
    num= String.fromCharCodes(Iterable.generate(4, (_) => number.codeUnitAt(random.nextInt(number.length))));
    char= String.fromCharCodes(Iterable.generate(4, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    return num+char;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          actions: [CircleAvatar(
            backgroundImage: AssetImage('images/s2.jpg'),
            radius: 20.0,
            backgroundColor: Colors.white,),],
          title: Text("Simple Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 0,
             child: Center(
                  child: Form(child:Flex(direction: Axis.vertical,
                    children: [
                          ListTile(leading: Icon(Icons.password),
                          title: TextFormField(
                            controller: text,
                            validator: (val)=>val==""?val:null,
            ),
          ),
                      SizedBox(
                        height: 5.0,
                      ),
                   Text('Hint: 1234sana'),
                      SizedBox(
                     height: 10.0,),
                      ElevatedButton(onPressed: (){
                        final password=generatepassword();
                        text.text=password;},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          elevation: 10.0, // Elevation
                          shadowColor: Colors.purpleAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("Generate Password"),),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: ()async{
                          await FirebaseFirestore.instance.collection('pocketpassword').add(
                            {
                              'password':text.text,
                            });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          elevation: 10.0, // Elevation
                          shadowColor: Colors.purpleAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("Save"),
                      ),
        ]),

            ),),
            ),
          ],
        ),
      );

  }
}
