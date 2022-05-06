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
    //final len=8;
    //final Lowercaseletter = "abcdefghijklmnopqrstuvwxyz";
    //final n="0123456789";
    //String chars ='';
     //chars +="$Lowercaseletter";
    //chars +="$n";

     //return List.generate(len, (index){
       //final indexrandom=Random.secure().nextInt(chars.length);
       //return chars[indexrandom];

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Password"),
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
                   Text('Hint: 1234sana'),
                   SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){
                        final password=generatepassword();
                        text.text=password;

                      }, child: Text("Generate Password"),),
                      ElevatedButton(
                        onPressed: ()async{
                          await FirebaseFirestore.instance.collection('pocketpassword').add(
                            {
                              'password':text.text,
                            });
                        },
                        child: Text("save"),
                      ),
        ]),

            ),),
            ),
          ],
        ),
      ),
    );
  }
}
