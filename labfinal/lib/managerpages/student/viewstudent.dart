import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/spinkit.dart';
import '../../Method.dart';
import '../../Pdffunction/mobiledart.dart';
class viewstudent extends StatefulWidget {
  const viewstudent({Key? key}) : super(key: key);

  @override
  _viewstudentState createState() => _viewstudentState();
}

class _viewstudentState extends State<viewstudent> {
  String tname = '';
  String phone = '';
  String email = '';
  String subject = '';
  String classes = '';
  String pass = '';
  bool loading=true;
  bool isFirstTime=false;
  final Pdfservices _pdfservices=Pdfservices();
  List Pdfdata = [];

  Stream<QuerySnapshot> getUserdata() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance.collection("institution")
        .doc(uid).collection("students").snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('View Students Record',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed:()async{
              await getData();
              if(Pdfdata.isNotEmpty){
                setState(() {
                  loading=true;
                });
                final data=await _pdfservices.createPdf(Pdfdata);
                _pdfservices.saveAndLanchFile(data, "Students Record.pdf");
                Pdfdata.clear();
              }
              else{
                setState(() {
                  loading=false;
                });
              }

            },

            icon: Icon(loading?Icons.download:Icons.arrow_circle_down_sharp),
          ),
        ],
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
  getData() async {
    final uid = await getuserid();
    await FirebaseFirestore.instance.collection("institution").doc(uid).collection("students").get().then((value) {
      for(var i in value.docs) {
        Pdfdata.add(i.data());


      }
    });
  }
}
class customcard extends StatelessWidget {

  customcard({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docId=snapshot.docs[index].id;
    TextEditingController name=new TextEditingController(text: snapshot.docs[index]['name']);
    TextEditingController phone=new TextEditingController(text: snapshot.docs[index]['phone']);
    TextEditingController email=new TextEditingController(text: snapshot.docs[index]['email']);
    TextEditingController subject=new TextEditingController(text: snapshot.docs[index]['subject']);
    TextEditingController classes=new TextEditingController(text: snapshot.docs[index]['classes']);
    TextEditingController pass=new TextEditingController(text: snapshot.docs[index]['passwpord']);
    return Card(
      margin: EdgeInsets.only(top:10.0),
      color:Colors.lightBlue.shade50 ,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              radius: 25.0,
              child: Text("${snapshot.docs[index]['name'][0]}",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${snapshot.docs[index]['name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("phone: ${snapshot.docs[index]['phone']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("Email: ${snapshot.docs[index]['email']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("subject: ${snapshot.docs[index]['subject']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("class: ${snapshot.docs[index]['classes']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("password: ${snapshot.docs[index]['passwpord']}",
                      style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              IconButton(
                onPressed: ()async{
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Update'),
                        content:  SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: name,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: phone,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: subject,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.subject_sharp,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: classes,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.class__outlined,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: pass,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.password,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if(name.text.isNotEmpty&&phone.text.isNotEmpty&&email.text.isNotEmpty&&subject.text.isNotEmpty&&classes.text.isNotEmpty&&
                                  pass.text.isNotEmpty)
                              {
                                final uid=await getuserid();
                                FirebaseFirestore.instance.collection('institution').doc(uid).collection("students").doc(docId).update({"name":name.text,"phone":phone.text,"email":email.text,"subject":subject.text,"classes":classes.text,
                                  "passwpord":pass.text,
                                }).then((value) {
                                  Navigator.pop(context);
                                });
                              }

                            },
                            child: Text('Update', style: TextStyle(color: Colors.pink),),
                          ),
                          TextButton(
                            onPressed: (){

                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel', style: TextStyle(color: Colors.blue),),
                          ),
                        ],
                      );
                    },
                  );
                }, icon: Icon(
                Icons.edit,
                color: Colors.green,
              ),),
              IconButton(onPressed: () {
                showDialog(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('Are You sure!'),
                      actions: [
                        TextButton(onPressed: () async {
                          Navigator.of(context).pop();
                          final uid=await getuserid();
                          var FirebaseReference=FirebaseFirestore.instance.collection('institution').doc(uid).collection('students');
                          await FirebaseReference.doc(docId).delete();
                        },
                          child: Text('Yes',style: TextStyle(color: Colors.pink),),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text('No',style: TextStyle(color: Colors.blue),),
                        ),
                      ],

                    );
                  },
                );
              },
                icon: Icon(
                  Icons.delete,
                  color: Colors.pink,
                ),),
            ],
          )
        ],
      ),

    );
  }
}
