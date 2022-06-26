import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }

  //The Splash Screen will navigate through this funtion after a Delay of 3 seconds to the Login Page

  void navigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        PageNavigator(ctx: context).nextPageOnly(LoginPage());
      },
    );
  }
}
