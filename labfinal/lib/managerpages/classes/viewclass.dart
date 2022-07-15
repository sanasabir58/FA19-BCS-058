import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/Method.dart';
import 'package:labfinal/spinkit.dart';
class viewclass extends StatefulWidget {
  const viewclass({Key? key}) : super(key: key);

  @override
  _viewclassState createState() => _viewclassState();
}

class _viewclassState extends State<viewclass> {
  Stream<QuerySnapshot> getUserdata() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance.collection("institution")
        .doc(uid).collection("classes").snapshots();
  }
  bool loading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('view Classes',
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
        child: StreamBuilder(
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
    TextEditingController classes=new TextEditingController(text: snapshot.docs[index]['classN']);

    return Card(
      margin: EdgeInsets.only(top:10.0),
      color:Colors.lightBlue.shade50 ,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              radius: 25.0,
              child: Text("${snapshot.docs[index]['classN'][0]}",style: TextStyle(
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
                    Text("class: ${snapshot.docs[index]['classN']}",
                      style: TextStyle(color: Colors.black),),
                    SizedBox(
                      height: 5.0,
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
                                controller: classes,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if(classes.text.isNotEmpty)
                              {
                                final uid=await getuserid();
                                FirebaseFirestore.instance.collection('institution').doc(uid).collection("classes").doc(docId).update({'classN':classes.text
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
                          var FirebaseReference=FirebaseFirestore.instance.collection('institution').doc(uid).collection('classes');
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
