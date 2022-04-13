import 'package:flutter/material.dart';
class Repeatcontainercode extends StatelessWidget {
  Repeatcontainercode({@required  this.colors,this.cardWidget,this.onpreesed});
  final Color? colors;
  final Widget? cardWidget;
  final VoidCallback? onpreesed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpreesed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),),
    );
  }
}