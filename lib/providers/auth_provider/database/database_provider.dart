import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Using shared preferences to store the user data

class DatabaseProvider extends ChangeNotifier {
  //initialize the shared preference
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  //getter -public / accessible from other classes to read value from
  String get token => _token;
  String get userId => _userId;

  //setters --private
  String _token = " ";
  String _userId = " ";


  //funtion to save token
  void saveToken(){
    
  }










  //function to save user id
}
