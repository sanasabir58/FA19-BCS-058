import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
class viewclass extends StatefulWidget {
  const viewclass({Key? key}) : super(key: key);

  @override
  _viewclassState createState() => _viewclassState();
}

class _viewclassState extends State<viewclass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Classes',
          style: TextStyle(color: Colors.white,fontSize: 20.0,
              fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),


      ),
    );
  }
}
