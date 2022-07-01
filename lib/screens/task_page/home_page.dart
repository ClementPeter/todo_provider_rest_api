import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/task_page/task_field_container.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //databaseprovider instance
  DatabaseProvider databaseProvider = DatabaseProvider();
  List tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              databaseProvider.logOut(context);
              //AuthProvider.of(context).logout();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: tasks.isEmpty
            ? Center(
                child: Column(
                  children: [
                    // Text('T-Do is Empty', style: TextStyle(fontSize: 20),),'),
                    const Text(
                      'Todo List is empty',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // PageNavigator(ctx: context)
                        //     .nextPage(page: const CreateTaskPage());
                      },
                      child: Text(
                        'Create a task',
                        style: TextStyle(fontSize: 18, color: grey),
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                children: List.generate(5, (index) {
                  return TaskField(
                    initial: '${index + 1}',
                    title: 'Hello world',
                    subtitle: 'time',
                    taskId: 'id',
                    isCompleted: false,
                  );
                }),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '/add-task');
        },
      ),
    );
  }
}
