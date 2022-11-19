import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/screens/task_page/task_detail_page.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Custom widget that builds a ListTile as a To-Do Item and contains : (Title, initial, subtitle, CheckBox)
//This widget is used in TaskDetailpage.dart

class TaskFieldContainer extends StatefulWidget {
  TaskFieldContainer({
    Key? key,
    this.title,
    this.subtitle,
    this.taskId,
    this.initial, //Number tag on ListTile
    this.isCompleted,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? taskId;
  final String? initial;
  bool?
      isCompleted; //check if the task has been done : fase-not completed; true completed

  @override
  State<TaskFieldContainer> createState() => _TaskFieldContainerState();
}

class _TaskFieldContainerState extends State<TaskFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          //Ontap TaskFieldContainer (ListTile)...navigate to TaskDetailsPage and pass title and Id
          PageNavigator(ctx: context).nextPage(
            page: TaskDetailsPage(
              title: widget.title,
              taskId: widget.taskId,
            ),
          );
        },
        tileColor: lightGrey,
        leading: CircleAvatar(
          //foregroundColor: Colors.red,
          backgroundColor: widget.isCompleted == true ? green : amber,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundColor: lightAmber,
              child: Text(
                widget.initial!,
                style: TextStyle(color: primaryColor),
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
      ),
    );
  }
}
