import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
class addclass extends StatefulWidget {
  const addclass({Key? key}) : super(key: key);

  @override
  _addclassState createState() => _addclassState();
}

class _addclassState extends State<addclass> {
  TextEditingController classN=new TextEditingController();
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Classes',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
      body: Container(
          height: 700.0,
          width: 700.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/f1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: classN,
                  decoration: InputDecoration(
                    hintText: 'Enter Class',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),),),
              SizedBox(height: 20.0,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 100),
                child:  AnimatedButton(
                  width: 150.0,
                  child: Text('Add Class',style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
                  color: Colors.blue,
                  onPressed: () async {
                    if(classN.text.isNotEmpty){
                      {
                        setState(() {
                          isloading=true;
                        });
                        final uid=await getuserid();
                        await FirebaseFirestore.instance.collection('institution').doc(uid).collection('classes').add({'classN':classN.text})
                            .then((value){
                          print(value.id);
                          setState(() {
                            isloading=false;
                          });
                          classN.clear();

                          const snackBar = SnackBar(
                            content: Text('Data Save Successfully'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }).catchError((error){
                          print(error);
                        });
                      }
                    }
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),),
            ],
          )),
    );
  }
}

