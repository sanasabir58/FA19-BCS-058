

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocket_password/Authication/Method.dart';
import 'package:pocket_password/PDFfunction/mobiledart.dart';
import 'package:pocket_password/loadingworking/spinkit.dart';
import 'package:pocket_password/widget/customcard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';



class ViewPasswordScreen extends StatefulWidget {
  const ViewPasswordScreen({Key? key}) : super(key: key);

  @override
  _ViewPasswordScreenState createState() => _ViewPasswordScreenState();
}

class _ViewPasswordScreenState extends State<ViewPasswordScreen> {
  final Pdfservices _pdfservices=Pdfservices();
  List Pdfdata = [];
  bool isFirstTime=false;
  bool eyeVisibily=true;
  String name='';
  bool searchstate=false;
  bool loading=true;
  TextEditingController searchcontroller=TextEditingController();
  Stream<QuerySnapshot> getUserdata() async* {
    final uid = await getuserid();
    yield* FirebaseFirestore.instance
        .collection("PasswordBD")
        .doc(uid)
        .collection("password")
        .snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: !searchstate?Text("View All Password"):TextField(
          controller: searchcontroller,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search here....',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value)
          {
            setState(() {
              name=value;
            });
          },
        ),
        backgroundColor: Colors.blue,
        actions: [
          !searchstate? IconButton(
            onPressed: (){
              setState(() {
                searchstate=!searchstate;
              });

            },
            icon: Icon(Icons.search),
          )
              :IconButton(onPressed: (){
              setState(() {
                searchstate=!searchstate;
                searchcontroller.clear();
                name='';
              });

            },
                icon: Icon(Icons.cancel),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                eyeVisibily=!eyeVisibily;
              });

            },
            icon: Icon(eyeVisibily?Icons.visibility_off:Icons.visibility),
          ),
          IconButton(
            onPressed:()async{
              await getData();
              if(Pdfdata.isNotEmpty){
                setState(() {
                  loading=true;
                });
                final data=await _pdfservices.createPdf(Pdfdata);
                _pdfservices.saveAndLanchFile(data, "Pocket Password.pdf");
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
      body:StreamBuilder(
        stream: getUserdata(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData)return Center(child: spinkit);
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index)
          {
            if(name.isEmpty){
              return CustomCard(
                snapshot: snapshot.data,
                index: index,
                passvisibiliy: eyeVisibily,);
            }
            if(snapshot.data.docs[index]['name'].toString().toLowerCase().startsWith(name.toLowerCase())){
              return CustomCard(
                snapshot: snapshot.data,
                index: index,
                passvisibiliy: eyeVisibily,);
            }
            else
              {
                return Container();
              }


          });
        },
      ),
      );
  }
  // Future<void>_createPDF()async{
  //   PdfDocument document=PdfDocument();
  //   final page=document.pages.add();
  //   page.graphics.drawString('Pocket Password',PdfStandardFont(PdfFontFamily.helvetica, 30));
  //   List<int>bytes=document.save();
  //   document.dispose();
  //   saveAndlanchFile(bytes, 'Output.pdf');
  // }
  getData() async {
    final uid = await getuserid();
    await FirebaseFirestore.instance.collection("PasswordBD").doc(uid).collection("password").get().then((value) {
      for(var i in value.docs) {
        Pdfdata.add(i.data());


      }
    });
  }
}




// Stream<QuerySnapshot> getUserData(BuildContext context)async*{
//   final uid=await getuserid();
//   yield* FirebaseFirestore.instance.collection("PasswordBD").doc(uid).collection("password").snapshots();
// }





