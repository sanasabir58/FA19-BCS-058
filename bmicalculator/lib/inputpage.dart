import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'containercode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'textoricon.dart';
import 'constantfile.dart';
enum Gender{
  male,
  female,
}
int sliderheight=180;
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  child: Repeatcontainercode(
                  colors: selectGender==Gender.male?activeColor:deActiveColor,
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
                      selectGender=Gender.female;
                    });
                  },
                  child: Repeatcontainercode(
                  colors: selectGender==Gender.female?activeColor:deActiveColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'Female',
                  ),
              ),
                ),
              ),
            ],
          ),),
          Expanded(
            child:Repeatcontainercode(
              colors: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Height',
                      style: kLabelStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(sliderheight.toString(),style: knumberstyle),
                      Text('cm',style: kLabelStyle),

                    ],
                  ),
                  Slider(
                    value: sliderheight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                      setState(() {
                        sliderheight =newvalue.round();
                      });
                    },
                  ),
                ],
              ),
          ),),
          Expanded(
            child: Row(
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




