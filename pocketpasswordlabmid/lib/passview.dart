import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class passview extends StatefulWidget {
  const passview({Key? key}) : super(key: key);

  @override
  _passviewState createState() => _passviewState();
}

class _passviewState extends State<passview> {
  var firebasedb=FirebaseFirestore.instance.collection("pocketpassword").snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: firebasedb,
          builder: (context,AsyncSnapshot snapshot){
            if(!snapshot.hasData)return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
                itemBuilder: (context,int index){
              return Text(snapshot.data.docs[index]['password']);
            });
          },
        ),
      ),
    );
  }
}
