import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class passview extends StatefulWidget {
  const passview({Key? key}) : super(key: key);

  @override
  _passviewState createState() => _passviewState();
}

class _passviewState extends State<passview> {
  var firebasedb = FirebaseFirestore.instance.collection("pocketpassword").snapshots();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('images/s2.jpg'),
              radius: 20.0,
              backgroundColor: Colors.white,),
          ],
          title: Text("View Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: firebasedb,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  return Cardlist(querySnapshot: snapshot.data, index: index);
                  //return Text(snapshot.data.docs[index]['password']);
                });
          },
        ),
      );

  }
}

class Cardlist extends StatelessWidget {
  Cardlist({required this.querySnapshot, required this.index});
  final QuerySnapshot querySnapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docsid = querySnapshot.docs[index].id;
    TextEditingController password =
        new TextEditingController(text: querySnapshot.docs[index]['password']);
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("Password"),
            subtitle: Text(querySnapshot.docs[index]['password']),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async{
                  var FirebaseReference=FirebaseFirestore.instance.collection('pocketpassword');
                  await FirebaseReference.doc(docsid).delete();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  elevation: 5, // Elevation
                  shadowColor: Colors.purpleAccent,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text('Delete'),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: new Text("Update password"),
                      content: TextFormField(
                        controller: password,
                        validator: (val) => val == "" ? val : null,
                      ),
                      actions: <Widget>[
                        new ElevatedButton(
                          child: new Text("OK"),
                          onPressed: () {
                            if (password.text.isNotEmpty) {
                              FirebaseFirestore.instance
                                  .collection('pocketpassword')
                                  .doc(docsid)
                                  .update({
                                "password": password.text,
                              }).then((value) {
                                Navigator.pop(context);
                              });
                            }

                          },
                        ),
                        new ElevatedButton(
                          child: new Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  elevation: 5, // Elevation
                  shadowColor: Colors.purpleAccent,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text('Update'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
