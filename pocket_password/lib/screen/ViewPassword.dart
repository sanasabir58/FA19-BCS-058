

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocket_password/Authication/Method.dart';
import 'package:pocket_password/loadingworking/spinkit.dart';
import 'package:pocket_password/widget/customcard.dart';
import 'package:share_plus/share_plus.dart';

class ViewPasswordScreen extends StatefulWidget {
  const ViewPasswordScreen({Key? key}) : super(key: key);

  @override
  _ViewPasswordScreenState createState() => _ViewPasswordScreenState();
}

class _ViewPasswordScreenState extends State<ViewPasswordScreen> {
  
  bool eyeVisibily=true;
  String name='';
  bool searchstate=false;
  TextEditingController searchcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !searchstate?Text("View All Password"):TextField(
          controller: searchcontroller,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search here....',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value)
          {
            setState(() {
              name=value;
            });
          },
        ),
        backgroundColor: Colors.blue,
        actions: [
          !searchstate?
          IconButton(
            onPressed: (){
              setState(() {
                searchstate=!searchstate;
              });

            },
            icon: Icon(Icons.search),
          )
          :IconButton(
            onPressed: (){
              setState(() {
                searchstate=!searchstate;
                searchcontroller.clear();
                name='';
              });

            },
            icon: Icon(Icons.cancel),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: getUserData(context),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData)return Center(child: spinkit);
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index)
          {
            if(name.isEmpty){
              return CustomCard(
                snapshot: snapshot.data,
                index: index,
                icon: eyeVisibily?Icons.visibility_off:Icons.visibility,
                onpressed: (){
                  setState(() {
                    eyeVisibily=!eyeVisibily;
                  });
                },
                passvisibiliy: eyeVisibily,);
            }
            if(snapshot.data.docs[index]['name'].toString().toLowerCase().startsWith(name.toLowerCase())){
              return CustomCard(
                snapshot: snapshot.data,
                index: index,
                icon: eyeVisibily?Icons.visibility_off:Icons.visibility,
                onpressed: (){
                  setState(() {
                    eyeVisibily=!eyeVisibily;
                  });
                },
                passvisibiliy: eyeVisibily,);
            }
            else
              {
                return Container();
              }


          });
        },
      ),
      );
  }
}




Stream<QuerySnapshot> getUserData(BuildContext context)async*{
  final uid=await getuserid();
  yield* FirebaseFirestore.instance.collection("PasswordBD").doc(uid).collection("password").snapshots();
}





