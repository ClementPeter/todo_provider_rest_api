import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/screens/authentication/register.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';

//Login Page will contain 2 textfield w

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TextEdiitnng Controllers for our username and Password field...we make them private varialbe with (_) so they cant be accessed form another class
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  //Dispose method is used to dispoise contrrollers after use

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primaryColor,
      appBar: AppBar(centerTitle: true, title: const Text('Login')),
      //CustomScrollView is used to get custom scroll effect using Slivers
      body: CustomScrollView(
        //list of slivers
        slivers: [
          //In order not contain other widgets we use sliver to box adapter
          SliverToBoxAdapter(
            child: Container(
              // color: amber,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  //username textfield
                  customTextField(
                    title: 'username',
                    hint: 'Enter your username',
                    controller: _email,
                  ),
                  //passwrod Textfield
                  customTextField(
                    title: 'password',
                    hint: 'Enter your password',
                    controller: _password,
                  ),
                  //Button
                  customButton(
                    text: 'Login',
                    tap: () {},
                    context: context,
                    status: false,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(RegisterPage());
                    },
                    child: const Text('Register Instead'),
                  )
                ],
              ),
            ),
          )
        ], 
      ),
    );
  }
}