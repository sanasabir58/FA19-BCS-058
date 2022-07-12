import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
class addclass extends StatefulWidget {
  const addclass({Key? key}) : super(key: key);

  @override
  _addclassState createState() => _addclassState();
}

class _addclassState extends State<addclass> {
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
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Class',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),),),
              SizedBox(height: 20.0,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter fee',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),),),
              SizedBox(height: 20.0,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 100),
                child:  AnimatedButton(
                  width: 150.0,
                  child: Text('Add Class',style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
                  color: Colors.blue,
                  onPressed: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                ),),
            ],
          )),
    );
  }
}
