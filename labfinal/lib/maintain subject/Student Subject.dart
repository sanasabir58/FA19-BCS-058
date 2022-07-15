import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
import 'package:labfinal/spinkit.dart';

class AddStudentSubject extends StatefulWidget {
  AddStudentSubject({required this.docid,required this.StudentClass});
  final String docid;
  final String StudentClass;

  @override
  _AddStudentSubjectState createState() => _AddStudentSubjectState();
}

class _AddStudentSubjectState extends State<AddStudentSubject> {
  Stream<QuerySnapshot> getSubjectData()async*{
    final uid=await getuserid();
    yield* FirebaseFirestore.instance.collection('institution').doc(uid).collection('subject').snapshots();
  }
  var ssubject;
  var teacher="Not available";
  bool isLoading=false;
  Stream<QuerySnapshot> getUserData() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance
        .collection('institution')
        .doc(uid)
        .collection('students').doc(widget.docid).collection('studentsubject')
        .snapshots();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.StudentClass);
  }
  loadTeacher() async{
    FirebaseFirestore.instance.collection('institution').doc(FirebaseAuth.instance.currentUser!.uid).collection('teacher').where("subject",isEqualTo: ssubject).where("classes",isEqualTo: widget.StudentClass).get().then((document) {
      teacher=document.docs[0]['name'];
    });
    print("*****${teacher}***");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: Text('student subject',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
      body: isLoading?Center(child: spinkit,):Column(
        children: [
          SizedBox(height: 25),
          StreamBuilder<QuerySnapshot>(
            stream: getSubjectData(),
            builder: (context,AsyncSnapshot snapshot){
              if(!snapshot.hasData){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Data not available",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.class__outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              }
              else{
                List<DropdownMenuItem>subjectname=[];
                for(int i=0;i<snapshot.data.docs.length;i++){
                  DocumentSnapshot snap=snapshot.data.docs[i];
                  subjectname.add(
                    DropdownMenuItem(
                      child: Text(snap['subjectN'],style: TextStyle(color: Colors.blue,fontSize: 20),),
                      value: "${snap['subjectN']}",
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children:[
                        SizedBox(width: 20,),
                        DropdownButton<dynamic>(
                          items: subjectname, onChanged: (subject){
                          setState(() {
                            ssubject=subject;
                            loadTeacher();
                          });
                        },
                          value: ssubject,
                          hint: Text("Select Subject",style: TextStyle(color: Colors.blue,fontSize: 18,),),



                        ),

                      ],
                    ),
                  ),
                );

              }
            },
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: Text("Cancel"),
                //   style: ElevatedButton.styleFrom(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 35, vertical: 15),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () async{
                    if(ssubject!=null){
                      setState(() {
                        loadTeacher();
                        isLoading=true;
                      });
                      final uid=await getuserid();
                      FirebaseFirestore.instance.collection("institution").doc(uid).collection('students').doc(widget.docid).collection('studentsubject').add({
                        'name':ssubject,
                        'teacher':teacher,

                      });
                      setState(() {
                        isLoading=false;
                        ssubject=null;

                      });






                    }
                    else{
                      const snackBar = SnackBar(
                        content: Text('fill all data'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }


                  },
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35, vertical: 15),
                      primary: Colors.blue,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80),
          StreamBuilder(
              stream: getUserData(),
              builder: (context, AsyncSnapshot snapshot){
                if(!snapshot.hasData)
                {return Container(
                  child: Text("Nothing",),
                );


                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context,int index){
                        return StudentCustomeCard(snapshot: snapshot.data, index: index,document: widget.docid,);
                      }),
                );

              }),

        ],
      ),
    );
  }
}

class StudentCustomeCard extends StatelessWidget {
  StudentCustomeCard({required this.snapshot,required this.index,required this.document});
  final int index;
  final QuerySnapshot snapshot;
  final String document;

  @override
  Widget build(BuildContext context) {
    final _docid = snapshot.docs[index].id;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Row(
                    children: [
                      Text("Subject:  ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text(snapshot.docs[index]['name']),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Teacher:  ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text(snapshot.docs[index]['teacher']),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: ()async{
                final uid = await getuserid();
                var FirebaseReference = FirebaseFirestore.instance
                    .collection('institution').doc(uid).collection(
                    "students").doc(document).collection('studentsubject');
                await FirebaseReference.doc(_docid).delete();
              }, icon: Icon(Icons.delete_forever_sharp,color: Colors.red,),),

            ],
          ),
        ),
      ),
    );
  }
}