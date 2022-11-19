import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/task_page/home_page.dart';
//import 'package:todo_provider_rest_api/utils/snack_message.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';

//Class for Registering, Login of Users
class AuthenticationProvider extends ChangeNotifier {
  DatabaseProvider databaseProvider = DatabaseProvider();

  //Getters-- Allows the class to call them
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  //Setters-- Allows the class to change them
  bool _isLoading = false;
  String _resMessage = " ";

  //Function to Register User
  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context, //context is null value
  }) async {
    _isLoading = true;
    notifyListeners();

    final String registerUrl = AppUrl.registerUrl;
    //String url = "$requestBaseUrl/users/";

    //API payload
    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };

    //Register User
    try {
      //req awaits the value from the HTTP post request
      http.Response req = await http.post(
        Uri.parse(registerUrl),
        body: json.encode(body),
      );

      print("auth register status code : ${req.statusCode}");
      print("auth register body : ${req.body}");
      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Account Created";
        notifyListeners();
        //print(_resMessage);
        PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
      } else {
        print("auth register ${req.statusCode}");
        print("auth register ${res["message"]}");
        _isLoading = false;
        _resMessage = "Heyy...this Account already exists";
        print(_resMessage);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      //final res = json.decode(req.body);
      // _resMessage = res['messsage'];
      //final req = json.decode(req.body);
      // _resMessage = "Error : ${req['message']}";
      //_resMessage = res['message'];
      print("register : $_resMessage from catch (e) : $e");

      //print(':::: $e');
      notifyListeners();
    }
  }

  //Function to Login User
  void loginUser({
    required String email,
    required String password,
    BuildContext? context, //context is null value
  }) async {
    _isLoading = true;
    notifyListeners();

    //String url = "$requestBaseUrl/users/login";
    final String loginUrl = AppUrl.loginUrl;

    final body = {
      "email": email,
      "password": password,
    };

    http.Response req = await http.post(
      Uri.parse(loginUrl),
      body: json.encode(body),
    );
    final res = json.decode(req.body);

    try {
      http.Response req = await http.post(
        Uri.parse(loginUrl),
        body: json.encode(body),
      );

      print("login status code : ${req.statusCode}");
      print("login body : ${req.body}");
      final response = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        _resMessage = "Account Logged In";
        _isLoading = false;
        print(_resMessage);
        //Collect and Save needed User Data (id and token)  in DataBaseProvider and then navigate to the Homepage
        //UserId - Needed to : check if the user logged in & updating task
        //token : Needed to : Add Taks to Custom Backend
        final userId = response["user"]["id"];
        final token = response["authToken"];
        databaseProvider.saveUserId(userId);
        databaseProvider.saveToken(token);
        //notifyListeners();

        PageNavigator(ctx: context!)
            .nextPageOnly(page: const HomePage()); //Navigates to Homepage
        notifyListeners();
      } else {
        _isLoading = false;
        _resMessage = "Invalid Username or Password";
        print(_resMessage);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      print(_resMessage);

      notifyListeners();
    } catch (e) {
      _isLoading = false;
      //_resMessage =  req.body;
      _resMessage = res['message'];
      print(_resMessage);
      notifyListeners();
    }
  }

  //Function to clear the response message
  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
