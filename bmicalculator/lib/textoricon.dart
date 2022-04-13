import 'package:bmicalculator/constantfile.dart';
import 'package:flutter/material.dart';
class Repeaticontext extends StatelessWidget {
  Repeaticontext({@required this.iconData,this.label});
  final IconData? iconData;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 88.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          label!,
          style: kLabelStyle,
        ),
      ],
    );
  }
}