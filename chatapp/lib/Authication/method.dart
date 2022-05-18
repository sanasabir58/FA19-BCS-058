import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Loginpage.dart';

Future<User?>create(String name,String email,String password) async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  try{
    User? user=(await _auth.createUserWithEmailAndPassword(email: email, password: password))
    .user;
    if(user!=null)
      {
        print('Account creation Successfully');
        return user;
      }
    else{
      print('Account creation Failed');
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}
Future<User?>loginuser(String email,String password) async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  try{
    User? user=(await _auth.signInWithEmailAndPassword(email: email, password: password))
        .user;
    if(user!=null)
    {
      print('Account creation Successfully');
      return user;
    }
    else{
      print('Login Failed');
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}
Future logout(BuildContext context)async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  try{
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder:(context)=>Loginpage()));
  }
  catch(e){
    print(e);
    return null;
  };
}