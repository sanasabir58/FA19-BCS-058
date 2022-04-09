import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Repeatcontainercode(
                colors: Color(0xFF1D1E33),
              ),
              ),
              Expanded(child:Repeatcontainercode(
                colors: Color(0xFF1D1E33),
              ),
              ),
            ],
          ),),
          Expanded(child:Repeatcontainercode(
            colors: Color(0xFF1D1E33),
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: Repeatcontainercode(
                colors: Color(0xFF1D1E33),
              ),
              ),
              Expanded(child: Repeatcontainercode(  colors: Color(0xFF1D1E33),),),
            ],
          ),),
        ],
      )
    );
  }
}

class Repeatcontainercode extends StatelessWidget {
  Repeatcontainercode({@required  this.colors});
  final Color? colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),);
  }
}
