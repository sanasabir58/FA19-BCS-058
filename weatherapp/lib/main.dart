import 'package:flutter/material.dart';
import 'package:weatherapp/climate.dart';

void main()
{
  runApp(MaterialApp(
    title: "weather",
    debugShowCheckedModeBanner: false,
    home: climate(),
  ));
}