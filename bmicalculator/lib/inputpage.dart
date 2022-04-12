import 'package:flutter/material.dart';
import 'containercode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'textoricon.dart';
const activeColor = Color(0xFF1D1E33);
const deActiveColor = Color(0xFF111328);
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor=deActiveColor;
  Color femaleColor=deActiveColor;
  void updateColor(Gender gendertype)
  {
    if(gendertype==Gender.male)
      {
       maleColor=activeColor;
       femaleColor=deActiveColor;
      }
    if(gendertype==Gender.female)
    {
      maleColor=deActiveColor;
      femaleColor=activeColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  child: Repeatcontainercode(
                  colors: maleColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.person,
                    label: 'Male',
                  ),
              ),
                ),),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(Gender.female);
                    });
                  },
                  child: Repeatcontainercode(
                  colors: femaleColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'Female',
                  ),
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




