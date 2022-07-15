import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
class addsubject extends StatefulWidget {
  const addsubject({Key? key}) : super(key: key);

  @override
  _addsubjectState createState() => _addsubjectState();
}

class _addsubjectState extends State<addsubject> {
  TextEditingController subjectN=new TextEditingController();
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Subject',
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
                  controller: subjectN,
                  decoration: InputDecoration(
                    hintText: 'Enter Subject',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),),),
              SizedBox(height: 20.0,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 100),
                child:  AnimatedButton(
                  width: 150.0,
                  child: Text('Add Subject',style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
                  color: Colors.blue,
                  onPressed: () async {
                    if(subjectN.text.isNotEmpty){
                      {
                        setState(() {
                          isloading=true;
                        });
                        final uid=await getuserid();
                        await FirebaseFirestore.instance.collection('institution').doc(uid).collection('subject').add({'subjectN':subjectN.text})
                            .then((value){
                          print(value.id);
                          setState(() {
                            isloading=false;
                          });
                          subjectN.clear();

                          const snackBar = SnackBar(
                            content: Text('Data Save Successfully'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }).catchError((error){
                          print(error);
                        });
                      }
                    }
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),),
            ],
          )),
    );
  }
}

