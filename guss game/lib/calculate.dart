import 'package:flutter/material.dart';
class checkCalculate {
  checkCalculate({required this.checkguss,required this.maxnumber,required this.minnumber });

  final int checkguss;
  final int maxnumber;
  final int minnumber;

  String calnum(){

    return checkguss.toStringAsFixed(0);
  }

  String? getresult(){
    if(checkguss>=minnumber&&checkguss<=maxnumber){
      return 'Perfect';
    }else{
      if(checkguss<maxnumber)
        {
          return 'you are to high';
        }
      else{
        return 'you are to low';
      }
    }

  }

}