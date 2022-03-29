import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'colorPicker.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
  ));
}
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

class xylo extends StatelessWidget {
  xylo({required this.cn1,required this.cn2,required this.cn3,required this.cn4,required this.cn5,required this.cn6,required this.cn7,required this.num1,required this.num2,
    required this.num3,required this.num4,required this.num5,required this.num6,
    required this.num7});
  final Color cn1;
  final Color cn2;
  final Color cn3;
  final Color cn4;
  final Color cn5;
  final Color cn6;
  final Color cn7;
  final int num1;
  final int num2;
  final int num3;
  final int num4;
  final int num5;
  final int num6;
  final int num7;




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

      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num1.wav');
              }, child: Text('A',),
                  style: ElevatedButton.styleFrom(
                    primary: cn1,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num2.wav');
              }, child: Text('B'),
                  style: ElevatedButton.styleFrom(
                    primary: cn2,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num3.wav');
              }, child: Text('C'),
                  style: ElevatedButton.styleFrom(
                    primary: cn3,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num4.wav');
              }, child: Text('D'),
                  style: ElevatedButton.styleFrom(
                    primary: cn4,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num5.wav');
              }, child: Text('E'),
                  style: ElevatedButton.styleFrom(
                    primary: cn5,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num6.wav');
              }, child: Text('F'),
                  style: ElevatedButton.styleFrom(
                    primary: cn6,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ElevatedButton(onPressed: (){
                final audioplayer = AudioCache();
                audioplayer.play('audio$num7.wav');
              }, child: Text('G'),
                  style: ElevatedButton.styleFrom(
                    primary: cn7,
                    textStyle: const TextStyle(fontSize: 30),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


