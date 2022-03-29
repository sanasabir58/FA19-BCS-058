

import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'main.dart';



class splashscreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: xylo1(),
        duration: 3000,
        imageSize: 130,
        imageSrc: "xylo.png",
        text: "welcome to xyloapp",
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }
}



class xylo1 extends StatefulWidget {
  const xylo1({Key? key}) : super(key: key);

  @override
  State<xylo1> createState() => _xylo1State();
}

class _xylo1State extends State<xylo1> {
  Color pickerColor=Colors.purpleAccent;
  Color pickerColor1=Colors.purpleAccent;
  Color pickerColor2=Colors.purpleAccent;
  Color pickerColor3=Colors.purpleAccent;
  Color pickerColor4=Colors.purpleAccent;
  Color pickerColor5=Colors.purpleAccent;
  Color pickerColor6=Colors.purpleAccent;

  void changeColor(Color color){
    setState(() {
      pickerColor=color;
    });
  }
  void changeColor1(Color color){
    setState(() {
      pickerColor1=color;
    });
  }
  void changeColor2(Color color){
    setState(() {
      pickerColor2=color;
    });
  }
  void changeColor3(Color color){
    setState(() {
      pickerColor3=color;
    });
  }
  void changeColor4(Color color){
    setState(() {
      pickerColor4=color;
    });
  }
  void changeColor5(Color color){
    setState(() {
      pickerColor5=color;
    });
  }
  void changeColor6(Color color){
    setState(() {
      pickerColor6=color;
    });
  }

  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  TextEditingController controller3=TextEditingController();
  TextEditingController controller4=TextEditingController();
  TextEditingController controller5=TextEditingController();
  TextEditingController controller6=TextEditingController();
  TextEditingController controller7=TextEditingController();
  int n1=1;
  int n2=2;
  int n3=3;
  int n4=4;
  int n5=5;
  int n6=6;
  int n7=7;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xylo App'),
        backgroundColor: Colors.purple,
        leading: Icon(
            Icons.apps_rounded ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Text('save',),
        backgroundColor: Colors.purple,
        onPressed: (){
          if(controller1.text.isEmpty||controller2.text.isEmpty||controller3.text.isEmpty||controller4.text.isEmpty||controller5.text.isEmpty||controller6.text.isEmpty||controller7.text.isEmpty)
          {
            n1=1;
            n2=2;
            n3=3;
            n4=4;
            n5=5;
            n6=6;
            n7=7;
          }
          else
          {
            n1=int.parse(controller1.text);
            n2=int.parse(controller2.text);
            n3=int.parse(controller3.text);
            n4=int.parse(controller4.text);
            n5=int.parse(controller5.text);
            n6=int.parse(controller6.text);
            n7=int.parse(controller7.text);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>xylo(cn1: pickerColor,cn2: pickerColor1,cn3: pickerColor2,cn4: pickerColor3,cn5: pickerColor4,cn6: pickerColor5,cn7: pickerColor6,num1: n1,num2: n2,num3: n3,num4: n4,
            num5: n5,num6: n6,num7: n7,)));
        },
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 5.0,left: 10,bottom: 5.0,right: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio1sound"),
                                controller: controller1,
                              ),
                            ),
                            SizedBox(
                              width: 9.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio2sound"),
                                controller: controller2,
                              ),
                            ),
                            SizedBox(
                              width: 9.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio3sound"),
                                controller: controller3,
                              ),
                            ),
                            SizedBox(
                              width: 9.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio4sound"),
                                controller: controller4,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio5sound"),
                                controller: controller5,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio6sound"),
                                controller: controller6,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: "select 1to7",
                                    labelText: "audio7sound"),
                                controller: controller7,
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ))),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 5.0,left: 10,bottom: 5.0,right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor,pickerColor: pickerColor,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor(pickerColor);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));
                    }, child: Text('A',),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor1,pickerColor: pickerColor1,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor1(pickerColor1);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));
                    }, child: Text('B'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor1,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor2,pickerColor: pickerColor2,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor2(pickerColor2);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));
                    }, child: Text('C'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor2,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor3,pickerColor: pickerColor3,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor3(pickerColor3);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));
                    }, child: Text('D'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor3,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor4,pickerColor: pickerColor4,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor4(pickerColor4);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));

                    }, child: Text('E'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor4,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor5,pickerColor: pickerColor5,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor5(pickerColor5);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));

                    }, child: Text('F'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor5,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            content:SingleChildScrollView(
                              child: ColorPicker(onColorChanged: changeColor6,pickerColor: pickerColor6,),),
                            actions: [
                              TextButton(onPressed: (){
                                changeColor6(pickerColor6);Navigator.pop(context);
                              }, child: Text('apply color'),)
                            ],
                          ));

                    }, child: Text('G'),
                        style: ElevatedButton.styleFrom(
                          primary: pickerColor6,
                          textStyle: const TextStyle(fontSize: 30),
                        )
                    ),
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
