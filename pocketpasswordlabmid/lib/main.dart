import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketpasswordlabmid/passview.dart';
import 'package:pocketpasswordlabmid/simplepassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(passview());
}
class pocketpassword extends StatefulWidget {
  const pocketpassword({Key? key}) : super(key: key);

  @override
  _pocketpasswordState createState() => _pocketpasswordState();
}

class _pocketpasswordState extends State<pocketpassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Pocket Password Dairy"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        backgroundColor: Colors.purpleAccent.shade100,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:(){}, child: Text('Simple Password'),),
                  ElevatedButton(onPressed:(){}, child: Text('Tough Password'),),
                  ElevatedButton(onPressed:(){}, child: Text('view All Password'),),
                ],
        ),
            )),
      ),
    );
  }
}


