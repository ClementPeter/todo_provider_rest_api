import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
//import 'package:todo_provider_rest_api/providers/auth_provider/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/screens/task_page/add_task_page.dart';
import 'package:todo_provider_rest_api/screens/task_page/home_page.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
/*Provider folder stores the providers variables and functions that chages overtime
Providers that communicate witth the app
*/
//Provider for user authentication
//Login / Authentication  using AuthProvider class; Holds the funtions to create a new user and login
//funtionalities and also notifies the app when the user is logged in or logged out

//ChangeNotifier enables us to use notifyListerners--
//This AuthProvider class is a clss we will use as a provider in our main.dar to listen to registration and login events
class AuthenticationProvider extends ChangeNotifier {
  //Web Url prefix
  final baseUrl = AppUrl.baseUrl;

  //Getters-- Allows the class to call them
  bool get isLoading => _isLoading;
  String get responseMessage => _responseMessage;

  //Setters
  bool _isLoading = false;
  String _responseMessage = " ";

  //create new databaseProvider object/insance
  final DatabaseProvider databaseProvider = DatabaseProvider();

  //Function to perform Registration for new users and accepts various named parameters
  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    //When registerUser function is triggerred isLoading becomes TRUE
    _isLoading = true;
    notifyListeners();

    String url = "$baseUrl/users/";

    //body ---A map that is going to be passed to the POST request as "body"
    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };

    //Making HTTP call to REGISTER a user... (POST) request inside TRY-CATCH BLOCK
    //Register / create a new user is a POST request from the backend
    try {
      //print(body);
      http.Response request =
          await http.post(Uri.parse(url), body: json.encode(body));

      //HTTP checks for a success request
      if (request.statusCode == 200 || request.statusCode == 201) {
        // print(request.statusCode);
        _isLoading = false;
        _responseMessage = 'Account Created Successfully';

        // PageNavigator(ctx: context).nextPage(page: const LoginPage());
        notifyListeners();
      } else {
        //if there is error--- get the body of response
        // print(request.statusCode);
        // final response = json.decode(request.body);
        // print(response['message']);

        //fetching out the error message by plugging into the json
        _responseMessage = 'Account already Exists';
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      // print('Socket Exception');
      // print(request.statusCode);
      // print(request.body);
      _isLoading = false;
      _responseMessage = 'Internet connection is not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _responseMessage = "Please try again`";
      print(':::: $e');
      notifyListeners();
    }
  }

  //Login user
  //Function to perform Registration for new users, accepts various named parameters
  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$baseUrl/users/login";

    //body --- A map that is going to be passed to the POST request as "body"
    final body = {'email': email, 'password': password};

    //Making HTTP call to LOGIN a user... (POST) request inside TRY-CATCH BLOCK
    //Create new usr is a POST request from the backend
    try {
      http.Response request =
          await http.post(Uri.parse(url), body: json.encode(body));
      // print(url);

      //HTTP checks for a success request
      if (request.statusCode == 200 || request.statusCode == 201) {
        //print(request.body);
        final response = json.decode(request.body);
        print(response);

        _responseMessage = 'Account Logged In';
        _isLoading = false;
        //_isLoading = false;
        //_resMessage = "Login successfull!";
        notifyListeners();

        ///Save users data and then navigate to homepage
        final userId = response['user']['id'];
        final token = response['authToken'];
        DatabaseProvider().saveToken(token);
        DatabaseProvider().saveUserId(userId);
        //Navigator.push(            context!, MaterialPageRoute(builder: (context) => HomePage()));

        //Navigator.push(context:BuildContext, MaterialPageRoute())
        // PageNavigator(ctx: context).nextPageOnly(page: const HomePage());

        //Save user data and navigate to homepage
        // final userId = response['user']['id'];
        // final token = response['authToken'];
        // print(userId);
        // print(token);

        //save user data to the shared preference database
        //databaseProvider.saveToken(token);
        //databaseProvider.saveUserId(userId);

        //PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
        PageNavigator(ctx: context!).nextPage(page: const AddTaskPage());
        //print('Navigated to a home/ add pasge');

        //notifyListeners();
      } else {
        print("${request.statusCode} from else command");
        //print(request.body);

        //if there is error--- get the body of response
        final response = json.decode(request.body);

        _responseMessage = response['message'];
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _responseMessage = 'Lost Internet Connection';
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('UNKNOWN ERROR ::::$e');

      _isLoading = false;
      _responseMessage = "Please try again";
      print('::::$e');
      notifyListeners();
    }
  }

  //function to clear the response message
  void clear() {
    _responseMessage = " ";
    //_isLoading = false;
    notifyListeners();
  }
}

