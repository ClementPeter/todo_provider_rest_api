import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';

//Custom Built TextField
// Null Safety Tips - ? after the datatype indicates the varialble can accept null
//_                   !  after the variable name indicates that variable is a nullable one
//Custom Textfield tha buld a textfield with essential features
Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int maxLines = 1,
}) {
  return Column(
    children: [
      //Textfield Title section
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, color: black),
        ),
      ),
      //TextField Section
      Container(z
      
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGrey,
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
        // decoration: ,
      ),
    ],
  );
}
