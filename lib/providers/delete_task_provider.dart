import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

class DeleteTask extends ChangeNotifier {
  //create new databaseProvider object/instance
  final DatabaseProvider databaseProvider = DatabaseProvider();

  //Web Url prefix
  final baseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them from other classes
  bool get status => _status;
  String get responseMessage => _responseMessage;

  //Setters-- use to change values in the class anad called by the getters
  bool _status = false;
  String _responseMessage = " ";

  void deleteTask({required String taskId}) async {
    final token = databaseProvider.getToken();
    final userId = databaseProvider.getUserId();

    _status = true;
    notifyListeners();

    String deleteTaskUrl = "$baseUrl/tasks/$taskId";

    try {
      final response = await http.delete(Uri.parse(deleteTaskUrl),
          headers: {'Authorization': 'Bearer $token'});

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
      _status = false;
      _responseMessage = error.toString();
      notifyListeners();
    }
  }
}
