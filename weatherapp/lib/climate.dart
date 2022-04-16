import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class climate extends StatefulWidget {
  const climate({Key? key}) : super(key: key);

  @override
  _climateState createState() => _climateState();
}

class _climateState extends State<climate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/umbrella.png'),
              fit: BoxFit.fill,
              width: 500.0,
              height: 700.0,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.0, 0.0),
            child: Text(
              'Spokane',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/light_rain.png',),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 150.0),
            child: Text('67.8F',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 49.9,
            ),),
          ),
        ],
      ),
    );
  }
}
