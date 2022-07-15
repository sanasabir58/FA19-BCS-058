import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
import 'package:labfinal/spinkit.dart';

import '../../maintain subject/Student Subject.dart';

class addsubStudent extends StatefulWidget {
  const addsubStudent({Key? key}) : super(key: key);

  @override
  _addsubStudentState createState() => _addsubStudentState();
}

class _addsubStudentState extends State<addsubStudent> {
  bool searchSate = false;
  String sname = "";


  Stream<QuerySnapshot> getUserData() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance
        .collection('institution')
        .doc(uid)
        .collection('students')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add student Record',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
      body:Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: StreamBuilder(
          stream: getUserData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: spinkit,
              );
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  if (sname.isEmpty) {
                    return CustomCard(
                      index: index,
                      snapshot: snapshot.data,
                    );
                  }
                  if (snapshot.data.docs[index]['name']
                      .toString()
                      .toLowerCase()
                      .startsWith(sname.toLowerCase())) {
                    return CustomCard(
                      index: index,
                      snapshot: snapshot.data,
                    );
                  } else {
                    return Container();
                  }
                });
          },
        ),
      ),

    );
  }
}
class CustomCard extends StatelessWidget {
  CustomCard({required this.snapshot,required this.index});
  final int index;
  final QuerySnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final docid=snapshot.docs[index].id;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentSubject(docid: docid,StudentClass: snapshot.docs[index]['class'],)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: ListTile(
            title: Text("Student name:   ${snapshot.docs[index]['name'].toString().toUpperCase()}"),
          ),
        ),
      ),
    );
  }
}