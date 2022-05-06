import 'package:flutter/material.dart';
class toughpassword extends StatefulWidget {
  const toughpassword({Key? key}) : super(key: key);

  @override
  _toughpasswordState createState() => _toughpasswordState();
}

class _toughpasswordState extends State<toughpassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 0,
              child: Center(
                child: Form(child:Flex(direction: Axis.vertical,
                    children: [
                      ListTile(leading: Icon(Icons.password),
                        title: TextFormField(
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Hint: 1234sana'),
                      SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){}, child: Text("tough Password"),),
                      ElevatedButton(onPressed: (){}, child: Text("save"),),
                    ]),

                ),),
            ),
          ],
        ),
      ),
    );
  }
}
