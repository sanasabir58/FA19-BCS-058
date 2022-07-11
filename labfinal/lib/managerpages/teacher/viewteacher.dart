import 'package:flutter/material.dart';
class viewteacher extends StatefulWidget {
  const viewteacher({Key? key}) : super(key: key);

  @override
  _viewteacherState createState() => _viewteacherState();
}

class _viewteacherState extends State<viewteacher> {
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
