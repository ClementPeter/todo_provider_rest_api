// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_provider_rest_api/providers/auth_provider/auth_provider.dart';
// import 'package:todo_provider_rest_api/screens/authentication/login.dart';

// import 'package:todo_provider_rest_api/utils/router.dart';
// import 'package:todo_provider_rest_api/utils/snack_message.dart';
// import 'package:todo_provider_rest_api/widgets/button.dart';
// import 'package:todo_provider_rest_api/widgets/text_field.dart';

// //Login Page will contain 2 textfield w

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   //TextEdiitnng Controllers for our username and Password field...we make them private varialbe with (_) so they cant be accessed form another class
//   final TextEditingController _firstName = TextEditingController();
//   final TextEditingController _lastName = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   //Dispose method is used to dispoise contrrollers after use

//   @override
//   void dispose() {
//     // TODO: implement dispose

//     // _firstName.clear();
//     // _lastName.clear();
//     // _email.clear();
//     // _password.clear();

//     // _email.dispose();
//     // _password.dispose();
//     // _firstName.dispose();
//     // _lastName.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: primaryColor,
//       appBar: AppBar(centerTitle: true, title: const Text('Register')),
//       //CustomScrollView is used to get custom scroll effect using Slivers
//       body: CustomScrollView(
//         //list of slivers
//         slivers: [
//           //In order not contain other widgets we use sliver to box adapter
//           SliverToBoxAdapter(
//             child: Container(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   //firstName textfield
//                   customTextField(
//                     title: 'First Name',
//                     hint: 'Enter your username',
//                     controller: _firstName,
//                   ),
//                   //last Name Textfield
//                   customTextField(
//                     title: 'Last Name',
//                     hint: 'Enter your username',
//                     controller: _lastName,
//                   ),
//                   //email Name Textfield
//                   customTextField(
//                     title: 'Email',
//                     hint: 'Enter your email',
//                     controller: _email,
//                   ),
//                   //password Textfield
//                   customTextField(
//                     title: 'password',
//                     hint: 'Enter your password',
//                     controller: _password,
//                   ),
//                   //Button
//                   Consumer<AuthenticationProvider>(
//                       builder: (context, auth, snapshot) {
//                     WidgetsBinding.instance!.addPostFrameCallback((_) {
//                       if (auth.responseMessage != "") {
//                         showMessage(
//                           message: auth.responseMessage.toUpperCase(),
//                           context: context,
//                         );
//                         auth.clear();
//                       }
//                     });
//                     return customButton(
//                       text: 'Register',
//                       tap: () {
//                         if (_firstName.text.isEmpty ||
//                             _firstName.text.isEmpty ||
//                             _email.text.isEmpty ||
//                             _password.text.isEmpty) {
//                           showMessage(
//                             message: 'Please fill in all the fields',
//                             context: context,
//                           );
//                         } else {
//                           auth.registerUser(
//                             context: context,
//                             firstName: _firstName.text.trim(),
//                             lastName: _lastName.text.trim(),
//                             email: _email.text.trim(),
//                             password: _password.text.trim(),
//                           );
//                         }
//                       },
//                       context: context,
//                       status: auth.isLoading,
//                     );
//                   }),
//                   GestureDetector(
//                     onTap: () {
//                       PageNavigator(ctx: context).nextPage(const LoginPage());
//                     },
//                     child: const Text('Login Instead'),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
