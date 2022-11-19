import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_rest_api/providers/taskprovider/add_task_provider.dart';
import 'package:todo_provider_rest_api/utils/snack_message.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';

//Create task page enables the user to add ToDo to the app
//You just dey start work and you dey happy as GitHub co-pilot dey give you code suggestions..."clap" issokay

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  //TextEdiiting Controllers for our title field...we make them private varialbe with (_) so they cant be accessed form another class
  final TextEditingController _title = TextEditingController();
  @override
  //clear title after page is destroyed
  void dispose() {
    // TODO: implement dispose
    _title.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Task"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    title: "Title",
                    controller: _title,
                    hint: "What do you plan to do",
                    // isPassword: false
                  ),
                  //Consumer listens to the provider and perform changes
                  Consumer<AddTaskProvider>(
                    builder: (context, addTask, child) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        if (addTask.responseMessage != '') {
                          showMessage(
                            message: addTask.responseMessage,
                            context: context,
                          );
                          ///Clear the response message to avoid duplicate
                          addTask.clear();
                        }
                      });
                      return customButton(
                        status: addTask.status,
                        context: context,
                        tap: () {
                          if (_title.text.isEmpty) {
                            showMessage(
                              message: "Please fill in the title",
                              context: context,
                            );
                          } else {
                            addTask.addTask(title: _title.text.trim());
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//














// class AddTaskPage extends StatefulWidget {
//   const AddTaskPage({Key? key}) : super(key: key);

//   @override
//   State<AddTaskPage> createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   //controlles the title text going into the customTextField Widget
//   final TextEditingController _title = TextEditingController();

//   @override
//   void dispose() {
//     _title.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Create Task')),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Container(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   customTextField(
//                     title: 'Title',
//                     controller: _title,
//                     hint: 'Enter your title',
//                   ),
//                   customButton(
//                     text: 'Add Task',
//                     tap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
