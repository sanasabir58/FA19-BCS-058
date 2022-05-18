import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class toughpassword extends StatefulWidget {
  const toughpassword({Key? key}) : super(key: key);

  @override
  _toughpasswordState createState() => _toughpasswordState();
}

class _toughpasswordState extends State<toughpassword> {
  TextEditingController lenght=new TextEditingController();
  TextEditingController lenghtcharacter=new TextEditingController();
  TextEditingController lenghtdigit=new TextEditingController();
  TextEditingController lenghtsymbol=new TextEditingController();
  TextEditingController lenghtpossword=new TextEditingController();
  String generatepassword(int len,int character,int digit,int sym ){
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    const number = '1234567890';
    const symbol='%*&()+!';
    String num1;
    String num2;
    String num3;
    String sum;

    Random random = Random();
    num1= String.fromCharCodes(Iterable.generate(digit, (_) => number.codeUnitAt(random.nextInt(number.length))));
    num2= String.fromCharCodes(Iterable.generate(character, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    num3= String.fromCharCodes(Iterable.generate(sym, (_) => symbol.codeUnitAt(random.nextInt(symbol.length))));
    sum= num1+num2+num3;
    List list=sum.split('');
    list.shuffle();
    String shuff=list.join();
    return shuff;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [CircleAvatar(
            backgroundImage: AssetImage('images/s2.jpg'),
            radius: 20.0,
            backgroundColor: Colors.white,),],
          title: Text("Tough Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible (
              flex: 0,
              child: Center(
                child: Form(
                  child:Flex(direction: Axis.vertical,
                    children: [
                      ListTile(
                        title: TextFormField(
                          controller: lenght,
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter Lenght of password'),
                      ListTile(
                        title: TextFormField(
                          controller: lenghtcharacter,
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many character in password'),
                      ListTile(
                        title: TextFormField(
                          controller: lenghtdigit,
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many digits in password'),
                      ListTile(
                        title: TextFormField(
                          controller: lenghtsymbol,
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many symbols in password'),
                      ListTile(
                        title: TextFormField(
                          controller: lenghtpossword,
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Hint: 1234sana**'),
                      SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){
                        int len=int.parse(lenght.text);
                        int charlen=int.parse(lenghtcharacter.text);
                        int digitlen=int.parse(lenghtdigit.text);
                        int symbolen=int.parse(lenghtsymbol.text);
                        final password=generatepassword(len, charlen, digitlen, symbolen);
                        lenghtpossword.text=password;
                      },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          elevation: 10.0, // Elevation
                          shadowColor: Colors.purpleAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("generate Password"),),
                      ElevatedButton(onPressed: ()async{
                        await FirebaseFirestore.instance.collection('pocketpassword').add({
                          "password":lenghtpossword.text,
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
                        child: Text("Save"),),
                    ]),

                ),),
            ),
          ],
        ),
      );

  }
}
