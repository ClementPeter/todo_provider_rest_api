/* Widgets folder contains widgets that are used throguhout the app ,
funtions that may /maynot accept values but returns Widgets in the app
Contains Global widgeets used throughout the app
*/


import 'package:flutter/material.dart';


//A pop up dialog to inform the user
void showMessage(String? message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
    ),
  );
}





//--CoPilot Suggestion
// void showMessage(String message, BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context){
//       return AlertDialog(
//         title: Text('Alert'),
//         content: Text('This is a alert dialog'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('OK'),
//             onPressed: (){
//               Navigator.of(context).pop();
//             },
//           )
//         ],
//       );
//     }
//   );
// }