import 'package:flutter/material.dart';
import 'package:todo_provider_rest_api/screens/authentication/login.dart';
import 'package:todo_provider_rest_api/styles/colors.dart';
import 'package:todo_provider_rest_api/utils/router.dart';
import 'package:todo_provider_rest_api/widgets/button.dart';
import 'package:todo_provider_rest_api/widgets/text_field.dart';

//Login Page will contain 2 textfield w

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //TextEdiitnng Controllers for our username and Password field...we make them private varialbe with (_) so they cant be accessed form another class
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  //Dispose method is used to dispoise contrrollers after use

  @override
  void dispose() {
    // TODO: implement dispose

    _firstName.clear();
    _lastName.clear();


////
///

    _email.dispose();
    _password.dispose();



    // _email.clear();
    // _email.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      appBar: AppBar(centerTitle: true, title: const Text('Register')),
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
                  //FirstName textfield
                  customTextField(
                    title: 'First Name',
                    hint: 'Enter your username',
                    controller: _firstName,
                  ),
                  //Last Name Textfield
                  customTextField(
                    title: 'Last Name',
                    hint: 'Enter your username',
                    controller: _lastName,
                  ),
                  //passwrod Textfield
                  customTextField(
                    title: 'password',
                    hint: 'Enter your password',
                    controller: _password,
                  ),
                  //Button
                  customButton(
                    text: 'Register',
                    tap: () {},
                    context: context,
                    status: false,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(LoginPage());
                    },
                    child: const Text('Login Instead'),
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
