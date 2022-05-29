

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
  
  bool eyeVisibily=true;
  String name='';
  bool searchstate=false;
  TextEditingController searchcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            eyeVisibily=!eyeVisibily;
          });
        },
        child: Icon(Icons.visibility),
      ),
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
          !searchstate?
          IconButton(
            onPressed: (){
              setState(() {
                searchstate=!searchstate;
              });

            },
            icon: Icon(Icons.search),
          )
          :IconButton(
            onPressed: (){
              setState(() {
                searchstate=!searchstate;
                searchcontroller.clear();
                name='';
              });

            },
            icon: Icon(Icons.cancel),
          ),
          IconButton(
            onPressed: _createPDF,
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: getUserData(context),
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
  Future<void>_createPDF()async{
    PdfDocument document=PdfDocument();
    final page=document.pages.add();
    page.graphics.drawString('Pocket Password',PdfStandardFont(PdfFontFamily.helvetica, 30));
    List<int>bytes=document.save();
    document.dispose();
    saveAndlanchFile(bytes, 'Output.pdf');
  }
}




Stream<QuerySnapshot> getUserData(BuildContext context)async*{
  final uid=await getuserid();
  yield* FirebaseFirestore.instance.collection("PasswordBD").doc(uid).collection("password").snapshots();
}





