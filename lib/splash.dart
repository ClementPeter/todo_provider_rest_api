import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/screens/task_page/home_page.dart';
import 'package:todo_provider_rest_api/utils/router.dart';

//Splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //databaseprovider instance
  DatabaseProvider databaseProvider = DatabaseProvider();

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }

  //Splash Screen will navigate through this function after a delay of 2 seconds to the Login Page--
  //-- if the user has been logged in before
  void navigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //Navigate to HomePage, based on whether user has logged in before or redirect user to LoginPage
        databaseProvider.getToken().then(
          (value) {
            if (value == " ") {
              PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
            } else {
              PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
            }
          },
        );
      },
    );
  }
}
