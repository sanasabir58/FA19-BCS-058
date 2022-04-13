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
int sliderweight=60;
int sliderage=20;
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
                child: Repeatcontainercode(
                  onpreesed: (){
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  colors: selectGender==Gender.male?activeColor:deActiveColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.person,
                    label: 'Male',
                  ),
              ),

              ),
              Expanded(
                child: Repeatcontainercode(
                  onpreesed: (){
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  colors: selectGender==Gender.female?activeColor:deActiveColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'Female',
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
                    activeColor: Color(0xFFBA68C8),
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
              Expanded(
                child: Repeatcontainercode(
                colors: Color(0xFF1D1E33),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style: kLabelStyle,
                      ),
                      Text(sliderweight.toString(),
                        style: knumberstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData:FontAwesomeIcons.minus ,
                            onpress: (){
                              setState(() {
                                sliderweight--;
                              });
                            },),
                          SizedBox(width: 10.0,),
                          RoundIcon(
                            iconData: FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                sliderweight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
              Expanded(child: Repeatcontainercode(
                colors: Color(0xFF1D1E33),
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',
                      style: kLabelStyle,),
                    Text(sliderage.toString(),
                      style: knumberstyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIcon(
                          iconData:FontAwesomeIcons.minus ,
                          onpress: (){
                            setState(() {
                              sliderage--;
                            });
                          },),
                        SizedBox(width: 10.0,),
                        RoundIcon(
                          iconData: FontAwesomeIcons.plus,
                          onpress: (){
                            setState(() {
                              sliderage++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),),
          Container(
            color: Color(0xFFBA68C8),
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
            width: double.infinity,
          ),
        ],
      )
    );
  }
}
class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.iconData,this.onpress});
  final IconData? iconData;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
        onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          height: 56.0,width: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}






