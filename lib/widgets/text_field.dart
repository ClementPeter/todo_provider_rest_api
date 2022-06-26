import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';

//Custom Built TextField
// Null Safety Tips - ? after the datatype indicates the varialble can accept null
//_                   !  after the variable name indicates that variable is a nullable one
Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int maxLines = 1,
}) {
  return Column(
    children: [
      //Title Text section
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, color: black),
        ),
      ),
      //TextField Section
      Container(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
        ),
      ),
    ],
  );
}
