import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/splash.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: primaryColor),
        primaryColor: primaryColor
       
      ),
      home: const SplashScreen()
    );
  }
}

