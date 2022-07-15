

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/homescreen.dart';
import 'package:labfinal/loginpage.dart';

import 'managerpages/managerdashboard.dart';

class CheckUser extends StatelessWidget {

FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!=null){
      return managerdashB();

    }
    else{
      return home();
    }
  }
}
