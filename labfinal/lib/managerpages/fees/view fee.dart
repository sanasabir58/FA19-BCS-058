import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
import 'package:labfinal/spinkit.dart';

class viewfee extends StatefulWidget {
  const viewfee({Key? key}) : super(key: key);

  @override
  _viewfeeState createState() => _viewfeeState();
}

class _viewfeeState extends State<viewfee> {
  String fee='';
  String classes='';
  Stream<QuerySnapshot> getUserdata() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance.collection("institution")
        .doc(uid).collection("fees").snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'View fees Record',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          // IconButton(
          //   onPressed:()async{
          //     await getData();
          //     if(Pdfdata.isNotEmpty){
          //       setState(() {
          //         loading=true;
          //       });
          //       final data=await _pdfservices.createPdf(Pdfdata);
          //       _pdfservices.saveAndLanchFile(data, "Students Record.pdf");
          //       Pdfdata.clear();
          //     }
          //     else{
          //       setState(() {
          //         loading=false;
          //       });
          //     }
          //
          //   },
          //
          //   icon: Icon(loading?Icons.download:Icons.arrow_circle_down_sharp),
          // ),
        ],
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
        child:  StreamBuilder(
          stream: getUserdata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return Center(child: spinkit);
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  return CustomCard(
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
class CustomCard extends StatelessWidget {

  CustomCard({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docId=snapshot.docs[index].id;
    TextEditingController fee=new TextEditingController(text: snapshot.docs[index]['fee']);
    TextEditingController classes=new TextEditingController(text: snapshot.docs[index]['classes']);
    var tclasses;

    return Card(
      margin: EdgeInsets.only(top:10.0),
      color:Colors.lightBlue.shade50 ,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              radius: 25.0,
              child: Text("${snapshot.docs[index]['classes'][0]}",style: TextStyle(
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
                    Text("fee: ${snapshot.docs[index]['fee']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("class: ${snapshot.docs[index]['classes']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),

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
                                controller: fee,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                              TextField(
                                controller: classes,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
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
                              if(fee.text.isNotEmpty&&classes.text.isNotEmpty)
                              {
                                final uid=await getuserid();
                                FirebaseFirestore.instance.collection('institution').doc(uid).collection("fees").doc(docId).update({'fee':fee.text,'classes':classes.text
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
                          var FirebaseReference=FirebaseFirestore.instance.collection('institution').doc(uid).collection('fees');
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
