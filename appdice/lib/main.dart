import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
  ));
}
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
void initState(){
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuilderContext)=>appdice()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/dice.jpg'),
      ),
    );
  }
}

class appdice extends StatefulWidget {
  const appdice({Key? key}) : super(key: key);

  @override
  _appdiceState createState() => _appdiceState();
}

class _appdiceState extends State<appdice> {
  var name="";
  var score=0;
  int image1 = 1;
  int image2 = 1;
  int image3 = 1;
  int image4 = 1;
  bool d1=true;
  bool d2=false;
  bool d3=false;
  bool d4=false;
  int player1=0;
  int player2=0;
  int player3=0;
  int player4=0;
  void check()
  {
    if(player1>player2&&player1>player3&&player1>player4)
      {
          name="Player 1";
          score=player1;
      }
    if(player2>player1&&player2>player3&&player2>player4)
    {
      name="Player 2";
      score=player2;
    }
    if(player3>player1&&player3>player2&&player3>player4)
    {
      name="Player 3";
      score=player3;
    }
    if(player4>player1&&player4>player2&&player4>player3)
    {
      name="Player 4";
      score=player4;
    }
  }

  void display()
  {
    setState(() {
      image1;
      image2;
      image3;
      image4;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'My Dice App'),
          leading: Icon(
              Icons.apps_outlined),
          backgroundColor: Colors.black87,
        ),
        backgroundColor: Colors.black12,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Image.asset('images/image$image1.png'),
                      onPressed:(){
                        setState(() {
                          if(d1==true){
                          image1=Random().nextInt(6)+1;
                          player1=player1+image1;
                          d1=false;
                          d2=true;
                          d3=false;
                          d4=false;
                          }
                        });
                      },
                    ),

                  ),
                  Expanded(
                    child: TextButton(
                      child: Image.asset('images/image$image2.png'),
                      onPressed:(){
                        setState(() {
                          if(d2==true){
                          image2=Random().nextInt(6)+1;
                          player2=player2+image2;
                          d2=false;
                          d3=true;
                          d4=false;
                          d1=false;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Image.asset('images/image$image3.png'),
                      onPressed:(){
                        setState(() {
                          if(d3==true){
                          image3=Random().nextInt(6)+1;
                          player3=player3+image3;
                          d3=false;
                          d4=true;
                          d2=false;
                          d1=false;}
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Image.asset('images/image$image4.png'),
                      onPressed:(){
                        setState(() {
                          if(d4==true){
                          image4=Random().nextInt(6)+1;
                          player4=player4+image4;
                          d4=false;
                          d1=true;
                          d2=false;
                          d3=false;
                          check();
                          Alert(
                            context: context,
                            title: "Congratulation",
                            desc: "$name win the match and Score: $score",
                          ).show();
                          }
                        });

                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                color: Colors.black87,
                child: Row(
                  children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(' player1: value= $player1',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0,
                       ),
                     ),
                     Text(' player2: value= $player2',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0,
                     ),),
                     Text(' player3: value= $player3',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0,
                     ),),
                     Text(' player4: value= $player4',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0,
                     ),),
                   ],
                 ),
                 ],
                ),
              ),
            ),

          ],
        ),
    );
  }
}
