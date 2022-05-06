import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketpasswordlabmid/passview.dart';
import 'package:pocketpasswordlabmid/simplepassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pocketpasswordlabmid/toughpassword.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:pocketpassword(),
  ));
}
class pocketpassword extends StatefulWidget {
  const pocketpassword({Key? key}) : super(key: key);

  @override
  _pocketpasswordState createState() => _pocketpasswordState();
}

class _pocketpasswordState extends State<pocketpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pocket Password Dairy"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>simplepassword()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 5, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Simple Password'),),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>toughpassword()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 5, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Tough Password'),),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>passview()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 5, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('view All Password'),),
                ],
        ),
            )),
      );

  }
}


