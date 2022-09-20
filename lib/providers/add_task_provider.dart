import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Class that Adds new ToDo tasks to the database via backend POST request
class AddTaskProvider extends ChangeNotifier {
  //create new databaseProvider object/instance
  final DatabaseProvider databaseProvider = DatabaseProvider();

  //Web Url prefix
  final baseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them from other classes
  bool get status => _status;
  String get responseMessage => _responseMessage;

  //Setters-- use to change values in the class anad called by the getters
  //Status trigger the "save" or "please wait button"
  bool _status = false;
  String _responseMessage = " ";

  //Function to Add Task to the database / backend API
  void addTask({
    required String title,
    // required String description,
    // required String date,
    // required String time,
    BuildContext? context,
  }) async {
    final token = databaseProvider.getToken();
    final userId = databaseProvider.getUserId();

    _status = true;
    notifyListeners();

    // String addTasksUrl = "$baseUrl/tasks/";
    final String addTaskUrl = AppUrl.addTaskUrl;

    //body -- A map that is going to be passed to the POST request as "body"
    final body = {
      'title': title,
      "startTime": "2022-08-18T11:01:00.000+00:00",
      "endTime": "2022-09-18T12:00:00.000+00:00",
      "userId": userId,
      "reminderPeriod": "2022-07-19T12:00:00.000+00:00"
      // 'description': description,
      // 'date': date,
      // 'time': time,
    };

    //Making HTTP call to Add a new Task to Database...(POST) request inside TRY-CATCH BLOCK

    try {
      //print(body);
      final response = await http.post(Uri.parse(addTaskUrl),
          body: json.encode(body), headers: {'Authorization': 'Bearer $token'});
      // final responseData = json.decode(response.body);
      int result = response.statusCode;
      print(result);

      //
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        _responseMessage = responseData['message'];
        _status = false;
        notifyListeners();
      } else {
        final responseData = json.decode(response.body);
        _responseMessage = responseData['message'];
        _status = false;
        notifyListeners();
      }
    } catch (error) {
      // _status = false;
      // notifyListeners();
      // _responseMessage = error.toString();
      // notifyListeners();
      _status = false;
      _responseMessage = error.toString();
      notifyListeners();
    }
  }

  void clear() {
    _responseMessage = " ";
    notifyListeners();
  }
}
