import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/weidget/cardweidget.dart';

import '../../spinkit.dart';

class viewteacher extends StatefulWidget {
  const viewteacher({Key? key}) : super(key: key);

  @override
  _viewteacherState createState() => _viewteacherState();
}

class _viewteacherState extends State<viewteacher> {
  String tname = '';
  String phone = '';
  String email = '';
  String subject = '';
  String classes = '';
  String pass = '';


  Stream<QuerySnapshot> getUserdata() async* {
    yield* FirebaseFirestore.instance.collection("teacher").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'view Teachers record',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: StreamBuilder(
          stream: getUserdata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return Center(child: spinkit);
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                    return customcard(
                      snapshot: snapshot.data,
                      index: index,
                    );




                });
          },
        ),
      ),
    );
  }
}
