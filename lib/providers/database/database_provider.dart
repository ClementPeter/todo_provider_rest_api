import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Using shared preferences to store the user data
//Provider for storing  user details in shared preferance

class DatabaseProvider extends ChangeNotifier {
  //initialize the shared preference --returns a Future
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  //getter -public / accessible from other classes to read value from
  String get token => _token;
  String get userId => _userId;

  //setters --private
  String _token = " ";
  String _userId = " ";

  //funtion to save token
  void saveToken(String token) async {
    SharedPreferences value = await _preference;
    //saves a user token value to the 'token' key
    value.setString('token', token);
    print("Token saved $token");
  }

  //function to save user id
  void saveUserId(String id) async {
    SharedPreferences value = await _preference;
    //saves a user id value to the 'id' key
    value.setString('id', id);
    print("Used id saved $id");
  }

  //Funtion to get the token out of shared preference after it has been saved

  Future<String> getToken() async {
    SharedPreferences value = await _preference;

    //check if data is available
    if (value.containsKey("token")) {
      //get token data from local storage with shared preference
      String data = value.getString("token")!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  //Funtion to get the UserId out of shared preference after it has been saved

  Future<String> getUserId() async {
    SharedPreferences value = await _preference;

    if (value.containsKey("id")) {
      String data = value.getString("id")!;
      //set the data to the "_userId" setter
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId:
      '';
      notifyListeners();
      return '';
    }
  }

  //function to clear the token and user id from the local storage
  void logOut(BuildContext context) async {
    final value = await _preference;
    value.clear();
    PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
  }
}
