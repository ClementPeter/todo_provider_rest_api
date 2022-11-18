import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//DatabaseProvider to save user ID and TOKEN temporarily using shared preference
//Funtionalities include saving user data and logging out
class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  //Getters- Public variables, accessible from other classes
  String get token => _token;
  String get userId => _userId;

  //Setters -Private variables, inaccessible from other classes
  String _token = '';
  String _userId = '';

  //Funtion to save token in shared preference
  void saveToken(String token) async {
    SharedPreferences value = await _preference;
    //print("value from save Token : $value");
    value.setString('token', token);
    print("value from await save Token : $value");
  }

  //Funtion to save user ID in shared preference
  void saveUserId(String userId) async {
    SharedPreferences value = await _preference;
    //print("value from save UserId : $value");
    value.setString('userId', userId);
    print("value from await save UserId : $value");
  }

  //Function to get "saved" user Token from shared preference
  Future getToken() async {
    SharedPreferences value = await _preference;

    if (value.containsKey('token')) {
      String data = value.getString("token")!;
      print("value from await get Token : ${value.get(data)}");
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  //Function to get "saved" user ID from shared preference
  Future getUserId() async {
    SharedPreferences value = await _preference;
    //print("value from get UserID : $value");
    if (value.containsKey('token')) {
      print("value from get UserID : $value");
      String data = value.getString('token')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return _userId;
    }
  }

  //Function to logout the user by clearing user token and ID from shared preference
  void logOut(BuildContext context) async {
    final value = await _preference;
    print("value from get logOut : $value , ${value.toString()}");
    value.clear();
    print("value from get logOut after clear : ${value.toString()}");
    PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
  }
}
