import 'package:bmicalculator/constantfile.dart';
import 'package:bmicalculator/inputpage.dart';
import 'package:flutter/material.dart';
import 'containercode.dart';
import 'constantfile.dart';
class resultscreen extends StatelessWidget {
  const resultscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Result'),),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Expanded(
               child:Container(
                 child: Center(
                   child:  Text('Your Result',style: ktitlestyles2,
                   ),
                 ),
               )
           ),
           Expanded(
             flex: 5,
               child:Repeatcontainercode(
                 colors: deActiveColor,
                 cardWidget: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text('Normal',
                         style: kresulttexts2),
                   Text('18.0',
                       style: kbmitextstyles2),
                     Text('bmi is low you should',textAlign: TextAlign.center,
                         style: kbmibodystyles2),
                   ],
                 ),
               ),
           ),
          Expanded(
            child:  GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
            },
            child: Container(
              child: Center(
                child: Text('Recalculator',
                    style: kLargebutton
                ),
              ),
              color: Color(0xFFBA68C8),
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              width: double.infinity,
            ),
          ),),

         ],
       ),
    );
  }
}
