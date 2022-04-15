import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'containercode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'textoricon.dart';
import 'constantfile.dart';
import 'resultfile.dart';
import 'package:bmicalculator/calculate.dart';
enum Gender{
  male,
  female,
}
int sliderheight=30;
int sliderweight=60;
int sliderage=20;
// int Maxnum=40;
// int minnum=20;
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maxvalue=100;
  int minvalue=1;
  int? selectnum;
  void selectrandom(int userselect){
    if(userselect==1)
      {
        selectnum=5;
        sliderheight=(minvalue+Random().nextInt(maxvalue-minvalue));
      }
    if(userselect==2)
    {
      selectnum=6;
      sliderheight=(minvalue+Random().nextInt(maxvalue-minvalue));
    }
  }
  Gender? selectGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('guss game for childern'),
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
                      selectrandom(1);
                    });
                  },
                  colors: selectGender==Gender.male?activeColor:deActiveColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.person,
                    label: 'Easy',
                  ),
              ),

              ),
              Expanded(
                child: Repeatcontainercode(
                  onpreesed: (){
                    setState(() {
                      selectGender=Gender.female;
                      selectrandom(2);
                    });
                  },
                  colors: selectGender==Gender.female?activeColor:deActiveColor,
                  cardWidget: Repeaticontext(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'Tough',
                  ),
              ),

              ),
            ],
          ),),
          Expanded(
            child:Repeatcontainercode(
              colors: Color(0xFF1D1E33),
              cardWidget:selectnum==6?null: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      '1.................100',
                      style: kLabelStyle),

                  Slider(
                     value: sliderheight.toDouble(),
                    min: minvalue.toDouble(),
                    max: maxvalue.toDouble(),
                    activeColor: Color(0xFFBA68C8),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged:(double newvalue){
                      // setState(() {
                      //   sliderheight =newvalue.round();
                      // }
                      // );
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
                      Text('max',style: kLabelStyle,
                      ),
                      Text(
                        sliderweight.toString(),
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
                          // RoundIcon(
                          //   iconData: FontAwesomeIcons.plus,
                          //   onpress: (){
                          //     setState(() {
                          //       Maxnum=(minvalue+Random().nextInt(maxvalue-minvalue));
                          //     });
                          //   },
                          // ),
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
                    Text('min',
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
                        // RoundIcon(
                        //   iconData:FontAwesomeIcons.minus ,
                        //   onpress: (){
                        //     setState(() {
                        //       minnum=(minvalue+Random().nextInt(maxvalue-minvalue));;
                        //     });
                        //   },),

                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){
              checkCalculate cal= checkCalculate(checkguss: sliderheight,maxnumber: sliderweight,minnumber: sliderage);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>resultscreen(
                calnumber: cal.calnum(),
                result: cal.getresult(),
              )));
            },
            child: Container(
              child: Center(
                child: Text('Calculator',
                    style: kLargebutton
                ),
              ),
              color: Color(0xFFBA68C8),
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              width: double.infinity,
            ),
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






