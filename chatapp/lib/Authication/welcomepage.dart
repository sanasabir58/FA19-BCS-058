import 'package:flutter/material.dart';

import 'method.dart';
class welcomepage extends StatelessWidget {
  const welcomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('logout'),
          onPressed: (){

            logout(context);
          },
        )
        ),
    );
  }
}
