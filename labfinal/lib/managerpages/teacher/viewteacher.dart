import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/weidget/cardweidget.dart';

import '../../Method.dart';
import '../../Pdffunction/mobiledart.dart';
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
  bool loading=true;
  bool isFirstTime=false;
  final Pdfservices _pdfservices=Pdfservices();
  List Pdfdata = [];

  Stream<QuerySnapshot> getUserdata() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance.collection("institution")
        .doc(uid).collection("teacher").snapshots();
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
        actions: [
          IconButton(
            onPressed:()async{
              await getData();
              if(Pdfdata.isNotEmpty){
                setState(() {
                  loading=true;
                });
                final data=await _pdfservices.createPdf(Pdfdata);
                _pdfservices.saveAndLanchFile(data, "Teachers Record.pdf");
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
  getData() async {
    final uid = await getuserid();
    await FirebaseFirestore.instance.collection("institution").doc(uid).collection("teacher").get().then((value) {
      for(var i in value.docs) {
        Pdfdata.add(i.data());


      }
    });
  }
}
