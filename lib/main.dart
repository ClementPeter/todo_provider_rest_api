import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
//import 'package:todo_provider_rest_api/providers/auth_provider/database/database_provider.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/splash.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Since we are using more than one provider in our app we'll use a MultiProvider to contain all of them
    return MultiProvider(
      providers: [
        //provider for user authentication
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        //Provider for storing  user details in shared preferance
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ],
      //
      child: MaterialApp(
        //title: 'Todo Provider Rest API',
        theme: ThemeData(
          //TextSelectionThemeData.cursorColor(red),
          appBarTheme: AppBarTheme(color: primaryColor),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: primaryColor),
          //primarySwatch: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
