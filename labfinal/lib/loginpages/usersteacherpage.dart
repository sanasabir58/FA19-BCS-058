import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/notification/view%20notification.dart';
import 'package:labfinal/spinkit.dart';

class UserteacherPage extends StatefulWidget {
  UserteacherPage({required this.teacherID});
  final String teacherID;

  @override
  _UserteacherPageState createState() => _UserteacherPageState();
}

class _UserteacherPageState extends State<UserteacherPage> {
  // String name="";
  // String img="";
  // String fees="";
  // String sclass="";
  // String phone="";
  // Future getUserData()async{
  //   try{
  //     DocumentSnapshot sn=await FirebaseFirestore.instance.collection('student').doc(widget.StudentID).get();
  //     name=sn.get('name');
  //     img=sn.get('password');
  //     fees=sn.get('fees');
  //     sclass=sn.get('class');
  //     String phone=sn.get('phone');
  //
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //
  //   }
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserData();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.circle_notifications),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => viewnotification()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('teacher')
              .doc(widget.teacherID)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: spinkit,
              );
            } else {
              var document = snapshot.data;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/f1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                 // margin: EdgeInsets.symmetric( horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "name:  ",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          document['name'].toString().toUpperCase(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "phone:  ",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          document['phone'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "class:  ",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          document['classes'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "password:  ",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          document['passwpord'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}

class CustomCard extends StatefulWidget {
  CustomCard({required this.snapshot, required this.index});

  final QuerySnapshot snapshot;
  final int index;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final docid = widget.snapshot.docs[widget.index].id;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/f1.jpg'),
          fit: BoxFit.fill,
        ),
      ),

      child: Column(
        children: [
          Row(
            children: [
              Text(
                "name:  ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(widget.snapshot.docs[widget.index]['name'].toString()),
            ],
          ),
          Row(
            children: [
              Text(
                "phone:  ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                widget.snapshot.docs[widget.index]['phone'].toString(),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "class:  ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(widget.snapshot.docs[widget.index]['classes'].toString()),
            ],
          ),
          Row(
            children: [
              Text(
                " passpword:  ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(widget.snapshot.docs[widget.index]['passwpord'].toString()),
            ],
          ),
        ],
      ),
    );
  }
}
