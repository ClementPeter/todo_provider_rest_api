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
  final url = AppUrl.baseUrl;

  //Setters-- use to change values in the class anad called by the getters
  //Status trigger the "save" or "please wait button"
  bool _status = false;
  String _responseMessage = '';

  //Getters-- Allows the class to call them from other classes
  bool get status => _status;
  String get responseMessage => _responseMessage;

  //Function to Add Task to the database / backend API
  void addTask({String? title}) async {
    //get Token and User Id from shared Preference
    final token = await databaseProvider.getToken();
    final userId = await databaseProvider.getUserId();

    _status = true;
    notifyListeners();

    // String addTasksUrl = "$baseUrl/tasks/";
    //final String addTaskUrl = AppUrl.addTaskUrl;
    final _url = "$url/tasks/";

    //working
    final body = {
      "title": title,
      "startTime": "2022-07-19T11:01:00.000+00:00",
      "endTime": "2022-06-20T12:00:00.000+00:00",
      "userId": userId,
      "reminderPeriod": "2022-07-19T12:00:00.000+00:00"
    };

    //Making HTTP call to Add a new Task to Database...(POST) request inside TRY-CATCH BLOCK

    //print(body);
    final response = await http.post(
      Uri.parse(_url),
      body: json.encode(body),
      headers: {'Authorization': 'Bearer $token'},
    );

    print("add task status: ${response.statusCode}");
    print("add task status: $response");

    //Regular If-else check with status code
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      print("add task status: $responseData");
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

  void clear() {
    _responseMessage = '';
    notifyListeners();
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// //import 'package:rest_api_app/Constants/url.dart';
// //import 'package:rest_api_app/Provider/Database/db_provider.dart';
// import 'package:todo_provider_rest_api/providers/database/database_provider.dart';

// import '../../constants/constants.dart';

// class AddTaskProvider extends ChangeNotifier {
//   final url = AppUrl.baseUrl;

//   bool _status = false;

//   String _response = '';

//   bool get status => _status;

//   String get responseMessage => _response;

//   ///Add task method
//   void addTask({String? title}) async {
//     final token = await DatabaseProvider().getToken();
//     final userId = await DatabaseProvider().getUserId();
//     _status = true;
//     notifyListeners();

//     final _url = "$url/tasks/";

//     // final body = {
//     //   "title": title,
//     //   "startTime": "2022-09-18T11:01:00.000+00:00",
//     //   "endTime": "2022-010-18T12:00:00.000+00:00",
//     //   "userId": userId,
//     //   "reminderPeriod": "2022-011-19T12:00:00.000+00:00"
//     // };
    // //working

    // final body = {
    //   "title": title,
    //   "startTime": "2022-07-19T11:01:00.000+00:00",
    //   "endTime": "2022-06-20T12:00:00.000+00:00",
    //   "userId": userId,
    //   "reminderPeriod": "2022-07-19T12:00:00.000+00:00"
    // };

//     final result = await http.post(Uri.parse(_url),
//         body: json.encode(body), headers: {'Authorization': 'Bearer $token'});

//     print(result.statusCode);

//     if (result.statusCode == 200 || result.statusCode == 201) {
//       final res = result.body;
//       print(res);
//       _status = false;
//       _response = json.decode(res)['message'];
//       notifyListeners();

//     } else {
//       final res = result.body;
//       print(res);
//       _response = json.decode(res)['message'];
//       _status = false;
//       notifyListeners();
//     }
//   }

//   void clear() {
//     _response = '';
//     notifyListeners();
//   }
// }
