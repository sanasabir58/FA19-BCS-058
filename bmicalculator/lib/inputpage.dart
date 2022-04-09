import 'package:flutter/material.dart';
import 'containercode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'textoricon.dart';
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
                cardWidget: Repeaticontext(
                  iconData: FontAwesomeIcons.person,
                  label: 'Male',
                ),
              ),),
              Expanded(child:Repeatcontainercode(
                colors: Color(0xFF1D1E33),
                cardWidget: Repeaticontext(
                  iconData: FontAwesomeIcons.personDress,
                  label: 'Female',
                ),
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




