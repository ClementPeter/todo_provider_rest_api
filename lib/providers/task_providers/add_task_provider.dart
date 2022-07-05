import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Helps inn adding new ToDo tasks to the database via backend POST request
class AddTaskProvider extends ChangeNotifier {
  //create new databaseProvider object/insance
  final DatabaseProvider databaseProvider = DatabaseProvider();

  //Web Url prefix
  final baseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them from other classes
  bool get status => _status;
  String get responseMessage => _responseMessage;

  //Setters-- use to change values in the class anad called by the getters
  bool _status = false;
  String _responseMessage = " ";

  //Function to Add Task to the database /backend API
  void addTask({
    required String title,
    // required String description,
    // required String date,
    // required String time,
    //BuildContext? context,
  }) async {
    //Set the status to true
    
    _status = true;
    notifyListeners();

    String url = "$baseUrl/tasks/";

    //body ---A map that is going to be passed to the POST request as "body"
    final body = {
      'title': title,
      // 'description': description,
      // 'date': date,
      // 'time': time,
    };

    //Making HTTP call to REGISTER a user... (POST) request inside TRY-CATCH BLOCK
    //Register / create a new user is a POST request from the backend
    try {
      //print(body);
      final response = await http.post(Uri.parse(url), body: body);
      final responseData = json.decode(response.body);
      //print(responseData);
      _status = false;
      notifyListeners();
      _responseMessage = responseData['message'];
      notifyListeners();
    } catch (error) {
      _status = false;
      notifyListeners();
      _responseMessage = error.toString();
      notifyListeners();
    }
  }
}
