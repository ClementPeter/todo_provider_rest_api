import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/task_page/add_task_page.dart';
import 'package:todo_provider_rest_api/screens/task_page/local_widgets/task_field_container.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
import 'package:todo_provider_rest_api/utils/snack_message.dart';

//Home Page of the app : contains, logout, empty task or list of Task and add task option

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //database provider instance
  DatabaseProvider databaseProvider = DatabaseProvider();

  //Empty list of tasks that accepts and loads To-Do tasks dynamically with ListTile
  List tasks = ["free", "now"];
  //List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To-Do'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              databaseProvider.logOut(context);
              showMessage(
                  message: "Account Logged Out succesfully", context: context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: tasks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Todo List is empty',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      child: Text(
                        'Create a task',
                        style: TextStyle(fontSize: 18, color: grey),
                      ),
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const AddTaskPage());
                      },
                    ),
                  ],
                ),
              )
            : ListView(
                children: List.generate(
                  3,
                  (index) {
                    return TaskFieldContainer(
                      initial: "${index + 1}",
                      title: "Good day Peter",
                      subtitle: "Put in the work and do it smartly",
                      isCompleted: false,
                      taskId: "Id",
                    );
                  },
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.add),
        onPressed: () {
          PageNavigator(ctx: context).nextPage(page: const AddTaskPage());

          //    Navigator.push(
          // context,
          // PageRouteBuilder(
          //   pageBuilder: (context, a, b) => const AddTaskPage(),
          // );
          // Navigator.push(context, MaterialPageRoute(builder: AddTaskPage()))
        },
      ),
    );
  }
}
