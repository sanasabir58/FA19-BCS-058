import 'package:flutter/material.dart';
class viewstudent extends StatefulWidget {
  const viewstudent({Key? key}) : super(key: key);

  @override
  _viewstudentState createState() => _viewstudentState();
}

class _viewstudentState extends State<viewstudent> {
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
