import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/screens/task_page/task_field_container.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key, this.title, this.taskId}) : super(key: key);

  final String? title;
  final String? taskId;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // databaseProvider.logOut(context);
              //AuthProvider.of(context).logout();
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TaskField(
                    initial: 'A',
                    title: 'Title',
                    subtitle: 'time',
                    taskId: '1',
                    isCompleted: false,
                    //controller: _title,
                    //hint: 'Enter your title',
                  ),
                  customTextField(
                    title: 'Title',
                    //controller: _title,
                    hint: 'Enter your title',
                  ),
                  customButton(
                    text: 'Update Task',
                    tap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
