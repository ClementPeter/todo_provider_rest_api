import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_provider_rest_api/constants/constants.dart';

//Login / Authentication login using Auth Provider class  hold the to create a new user and login funtionalities

//ChangeNotifier enables us to use notifyListerners-- 
//This AuthProvider class is a clss we will use as a provider in our main.dar to listen to registration and login events
class AuthenticationProvider extends ChangeNotifier {
  //
  final requestBaseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them
  bool get isLoading => _isLoading;
  String get responseMessage => _responseMessage;

  //Setters
  bool _isLoading = false;
  String _responseMessage = " ";

  //Function to perform  Registration for new users
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

    //body ---A map that is going to be passed to the POST request as "body"
    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    print(body);

    //Making HTTP call to REGISTER a user... (POST) request inside TRY-CATCH BLOCK
    //Create new usr is a POST request from the backend 
    try {
      http.Response request =
          await http.post(Uri.parse(url), body: json.encode(body));

      //HTTP checks for a success request
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
    _isLoading = false;
    _responseMessage = 'Internet not available';
    notifyListeners();
    } catch(e){
      print(':::: $e');
    }
  }


  //Login user
  //Function to perform  Registration for new users
  // accepts various named parameters
  void loginUser({
 
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/login";

    //body ---A map that is going to be passed to the POST request as "body"
    final body = {
  
      'email': email,
      'password': password,
    };
    print(body);

    //Making HTTP call to LOGIN a user... (POST) request inside TRY-CATCH BLOCK
    //Create new usr is a POST request from the backend 
    try {
      http.Response request =
          await http.post(Uri.parse(url), body: json.encode(body));

      //HTTP checks for a success request
      if (request.statusCode == 200 || request.statusCode == 201) {
        final response = json.decode(request.body);
        print(response.body);
        print("success");

        _isLoading = false;
        _responseMessage = 'Account Logged In';
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
    _isLoading = false;
    _responseMessage = 'Internet not available';
    notifyListeners();
    } catch(e){
      print(':::: $e');
    }
  }
}
