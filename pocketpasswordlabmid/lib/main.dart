import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketpasswordlabmid/simplepassword.dart';


void main() {
  runApp(simplepassword());
}
class pocketpassword extends StatefulWidget {
  const pocketpassword({Key? key}) : super(key: key);

  @override
  _pocketpasswordState createState() => _pocketpasswordState();
}

class _pocketpasswordState extends State<pocketpassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Pocket Password Dairy"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        backgroundColor: Colors.purpleAccent.shade100,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:(){}, child: Text('Simple Password'),),
                  ElevatedButton(onPressed:(){}, child: Text('Tough Password'),),
                  ElevatedButton(onPressed:(){}, child: Text('view All Password'),),
                ],
        ),
            )),
      ),
    );
  }
}

