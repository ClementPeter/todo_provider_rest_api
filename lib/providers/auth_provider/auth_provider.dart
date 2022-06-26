import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_provider_rest_api/constants/constants.dart';

//Login /Authentication login using Auth Provider to create a new user
class Authentication extends ChangeNotifier {
  //
  final requestBaseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them
  bool get isLoading => _isLoading;
  String get responseMessage => _responseMessage;

  //Setters
  bool _isLoading = false;
  String _responseMessage = " ";

  //Function to perform Registration
  // accepts various named parameters
  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/";

    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    print(body);

    //Making HTTP calls (POST) inside TRY-CATCH BLOCK
    try {
      http.Response request =
          await http.post(Uri.parse(url), body: json.encode(body));

      //  //HTTP checks
      if (request.statusCode == 200 || request.statusCode == 201) {
        final response = json.decode(request.body);
        print(response.body);
        print("success");

        _isLoading = false;
        _responseMessage = 'Account Created';
          notifyListeners();       

        

        //print(req);

      } else {
        final response = json.decode(request.body);
        print(response.body);
        print("404 _ not found");

        _isLoading = false;
        notifyListeners();
      }
    } on SocketException 
    catch (_) {
    //isLoading = false;
    _responseMessage = 'Internet not available ';
    } catch(e){
      print(e);
    }
  }
}
