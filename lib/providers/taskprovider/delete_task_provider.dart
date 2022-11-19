import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Provider class to delete tasks
class DeleteTaskProvider extends ChangeNotifier {
  //create new databaseProvider object/instance
  final DatabaseProvider databaseProvider = DatabaseProvider();

  //Web Url prefix
  final baseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them from other classes
  bool get status => _status;
  String get responseMessage => _responseMessage;

  //Setters-- use to change values in the class anad called by the getters
  bool _status = false;
  String _responseMessage = '';

  //Function to Delete Task to the database / backend API - DELETE request
  void deleteTask({String? taskId, BuildContext? ctx}) async {
    final token = await databaseProvider.getToken();
    // final userId = await databaseProvider.getUserId();
    _status = true;
    notifyListeners();

    String deleteTaskUrl = "$baseUrl/tasks/$taskId";

    final response = await http.delete(Uri.parse(deleteTaskUrl),
        headers: {'Authorization': 'Bearer $token'});

    print("delete task status: ${response.statusCode}");
    print("delete task status: $response");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      _responseMessage = responseData['message'];
      _status = false;
      notifyListeners();
      //
    } else {
      final responseData = json.decode(response.body);
      _responseMessage = responseData['message'];
      _status = false;
      notifyListeners();
    }
  }
}
