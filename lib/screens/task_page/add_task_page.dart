// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_provider_rest_api/widgets/button.dart';
// import 'package:todo_provider_rest_api/widgets/text_field.dart';

// //Crete task page enbales the user to add ToDo to the app

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
