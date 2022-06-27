import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
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
      // providers: [
      //   ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
      // ],
    );
  }
}
