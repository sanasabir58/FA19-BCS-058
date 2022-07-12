import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class customcard extends StatelessWidget {

  // TextEditingController phone=new TextEditingController();
  // TextEditingController email=new TextEditingController();
  // TextEditingController subject=new TextEditingController();
  // TextEditingController classes=new TextEditingController();
  // TextEditingController pass=new TextEditingController();
  customcard({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    // var docId=snapshot.docs[index].id;
    // TextEditingController tname=new TextEditingController(text: snapshot.docs[index]['teacher']);
    // TextEditingController phone=new TextEditingController(text: snapshot.docs[index]['teacher']);
    // TextEditingController email=new TextEditingController(text: snapshot.docs[index]['teacher']);
    // TextEditingController subject=new TextEditingController(text: snapshot.docs[index]['teacher']);
    // TextEditingController classes=new TextEditingController(text: snapshot.docs[index]['teacher']);
    // TextEditingController pass=new TextEditingController(text: snapshot.docs[index]['teacher']);
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              radius: 25.0,
              child: Text("${snapshot.docs[index]['tname'][0]}",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${snapshot.docs[index]['tname']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("${snapshot.docs[index]['phone']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("${snapshot.docs[index]['email']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("${snapshot.docs[index]['subject']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("${snapshot.docs[index]['class']}",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("${snapshot.docs[index]['password']}",
                      style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //
          //     // IconButton(
          //     //   onPressed: ()async{
          //     //     await showDialog(
          //     //       context: context,
          //     //       builder: (BuildContext context) {
          //     //         return AlertDialog(
          //     //           title: Text('Update Password'),
          //     //           content: TextField(
          //     //             controller: pass,
          //     //             decoration: InputDecoration(
          //     //                 icon: Icon(
          //     //                   Icons.password,
          //     //                   color: Colors.blue,
          //     //                 )
          //     //             ),
          //     //           ),
          //     //           actions: [
          //     //             TextButton(
          //     //               onPressed: () {
          //     //
          //     //               },
          //     //               child: Text('Update', style: TextStyle(color: Colors.pink),),
          //     //             ),
          //     //             TextButton(
          //     //               onPressed: (){
          //     //
          //     //                 Navigator.of(context).pop();
          //     //               },
          //     //               child: Text('Cancel', style: TextStyle(color: Colors.blue),),
          //     //             ),
          //     //           ],
          //     //         );
          //     //       },
          //     //     );
          //     //   }, icon: Icon(
          //     //   Icons.edit,
          //     //   color: Colors.green,
          //     // ),),
          //     // IconButton(onPressed: () {
          //     //   showDialog(
          //     //     context: context,
          //     //     builder:(BuildContext context){
          //     //       return AlertDialog(
          //     //         title: Text('Are You sure!'),
          //     //         actions: [
          //     //           TextButton(onPressed: () async {
          //     //           },
          //     //             child: Text('Yes',style: TextStyle(color: Colors.pink),),
          //     //           ),
          //     //           TextButton(onPressed: (){
          //     //             Navigator.of(context).pop();
          //     //           }, child: Text('No',style: TextStyle(color: Colors.blue),),
          //     //           ),
          //     //         ],
          //     //
          //     //       );
          //     //     },
          //     //   );
          //     // },
          //     //   icon: Icon(
          //     //     Icons.delete,
          //     //     color: Colors.pink,
          //     //   ),),
          //   ],
          // )
          ],
      ),

    );
  }
}
