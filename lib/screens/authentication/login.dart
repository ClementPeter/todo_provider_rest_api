import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';
import 'package:todo_provider_rest_api/screens/authentication/register.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
import 'package:todo_provider_rest_api/utils/snack_message.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
//Login Page will contain 2 textfield w

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //AuthenticationProvider auth = AuthenticationProvider();
  //TextEdiiting Controllers for our username and Password field...we make them private varialbe with (_) so they cant be accessed form another class
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  //
  DatabaseProvider databaseProvider = DatabaseProvider();

  //Dispose method is used to dispose contrrollers after use
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    // print('login page disposed');
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
          //In order not nest other widgets we use sliver to box adapter
          SliverToBoxAdapter(
            child: Container(
              // color: amber,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  //email textfield
                  customTextField(
                    title: 'Email',
                    hint: 'Enter your Email',
                    controller: _email,
                  ),
                  //password Textfield
                  customTextField(
                    title: 'Password',
                    hint: 'Enter your password',
                    controller: _password,
                  ),
                  Consumer<AuthenticationProvider>(
                      builder: (context, auth, child) {
                    WidgetsBinding.instance!.addPostFrameCallback(
                      (_) {
                        if (auth.resMessage != " ") {
                          showMessage(
                              message: auth.resMessage, context: context);
                          auth.clear();
                        }
                      },
                    );
                    return customButton(
                      text: "Login",
                      context: context,
                      status: auth.isLoading,
                      tap: () {
                        //manual textfield validator
                        if (_email.text.isEmpty || _password.text.isEmpty) {
                          showMessage(
                            message: 'Please fill all the fields for login',
                            context: context,
                          );
                        } else {
                          auth.loginUser(
                            context: context,
                            email: _email.text.trim(),
                            password: _password.text.trim(),
                          );
                        }
                      },
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(
                        page: const RegisterPage(),
                      );
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
