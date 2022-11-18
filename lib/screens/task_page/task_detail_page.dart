import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';

//Screen that displays a Detailed view (Contents) of  list of Task ,performs Updating and Deleting tasks

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key, this.title, this.taskId}) : super(key: key);

  //Constructor- title is the task title , taskId is from the backend API for updating and deleting
  final String? title;
  final String? taskId;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  final TextEditingController _title = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _title.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(
      () {
        //Populating the task detail page with "Title" data from the taskfield container when clicked on
        _title.text = widget.title!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  customTextField(
                    title: 'Title',
                    hint: 'what do you want to do',
                    controller: _title,
                  ),
                  // customButton(
                  //   text: 'Update Task',
                  //   tap: () {},
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
