import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';

class feesadd extends StatefulWidget {
  const feesadd({Key? key}) : super(key: key);

  @override
  _feesaddState createState() => _feesaddState();
}

class _feesaddState extends State<feesadd> {
  Stream<QuerySnapshot> getClassData()async*{
    final uid=await getuserid();
    yield* FirebaseFirestore.instance.collection('institution').doc(uid).collection('classes').snapshots();
  }
  TextEditingController fee=new TextEditingController();
  TextEditingController classes=new TextEditingController();
  bool isloading=false;
  var tclasses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Fee Record',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700.0,
          width: 700.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/f1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: fee,
                    decoration: InputDecoration(
                      hintText: 'Enter fees',
                      hintStyle: TextStyle(color: Colors.blue),
                    ),),),
                SizedBox(height: 20.0,),
                // Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: TextFormField(
                //     controller: classes,
                //     decoration: InputDecoration(
                //       hintText: 'Enter class',
                //       hintStyle: TextStyle(color: Colors.blue),
                //     ),
                //
                //   ),),
                StreamBuilder<QuerySnapshot>(
                  stream: getClassData(),
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
                            child: Text(snap['classN'],style: TextStyle(color: Colors.blue,fontSize: 12),),
                            value: "${snap['classN']}",
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
                                items: classname, onChanged: (classes){
                                setState(() {
                                  tclasses=classes;
                                });
                              },
                                value: tclasses,
                                hint: Text("Select Classes",style: TextStyle(color: Colors.blue,fontSize: 12,),),


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

                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 100),
                  child:  AnimatedButton(
                    width: 150.0,
                    child: Text('Add fees',style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),),
                    color: Colors.blue,
                    onPressed: () async {
                      if(fee.text.isNotEmpty&&tclasses.toString().isNotEmpty)
                      {
                        setState(() {
                          isloading=true;
                        });
                        final uid=await getuserid();
                        await FirebaseFirestore.instance.collection('institution').doc(uid).collection('fees').add({'fee':fee.text,'classes':tclasses.toString()})
                            .then((value){
                          print(value.id);
                          setState(() {
                            isloading=false;
                          });
                          fee.clear();
                          classes.clear();

                          const snackBar = SnackBar(
                            content: Text('fee Save Successfully'),
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
          ),
        ),
      ),
    );
  }
}
