import 'package:chatapp/Authication/Loginpage.dart';
import 'package:chatapp/Authication/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class checkuser extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!=null)
      {
        return welcomepage();
      }
    else{
     return Loginpage();
    }
  }
}
