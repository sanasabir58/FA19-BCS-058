import 'package:flutter/material.dart';
class simplepassword extends StatefulWidget {
  const simplepassword({Key? key}) : super(key: key);

  @override
  _simplepasswordState createState() => _simplepasswordState();
}

class _simplepasswordState extends State<simplepassword> {
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
                   SizedBox(height: 10.0,),
                   ElevatedButton(onPressed: (){}, child: Text("save"),),
                      ElevatedButton(onPressed: (){}, child: Text("Generate Password"),),
        ]),

            ),),
            ),
          ],
        ),
      ),
    );
  }
}
