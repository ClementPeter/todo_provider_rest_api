import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';

//Custom widget that builds a ListTile as a To-Do Item

class TaskField extends StatefulWidget {
  TaskField(
      {Key? key,
      this.title,
      this.subtitle,
      this.taskId,
      this.initial,
      this.isCompleted})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final String? taskId;
  final String? initial;
  bool? isCompleted;

  @override
  State<TaskField> createState() => _TaskFieldState();
}

class _TaskFieldState extends State<TaskField> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black,
      leading: CircleAvatar(
        backgroundColor: widget.isCompleted == true ? green : amber,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            child: Text(
              widget.initial!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      title: Text(
        widget.title!,
        style: TextStyle(
          decoration: widget.isCompleted == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        widget.subtitle!,
        style: TextStyle(
          decoration: widget.isCompleted == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(   

        value: widget.isCompleted,
        onChanged: (value) {
          setState(() {
            widget.isCompleted = value;
          });
        },
        fillColor: MaterialStateProperty.resolveWith(
          (states) =>
              widget.isCompleted == true ? green : grey.withOpacity(0.5),
        ),
      ),

      //title: Text(),
    );
  }
}
