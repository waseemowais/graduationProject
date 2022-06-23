// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import '../../component/loader.dart';
import 'package:mr_bookshare/component/internet_connection_dialog.dart';
import 'package:mr_bookshare/core/services/connectivity_service.dart';
import 'package:mr_bookshare/core/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 200,
                  child: Icon(
                    Icons.menu_book,
                    color: Color(0xff069e79),
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome, LogIn',
                  style: TextStyle(fontSize: 30, color: Color(0xff069e79)),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your Email',
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff069e79),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff069e79), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your password',
                      suffixIcon: const Icon(
                        Icons.password_outlined,
                        color: Color(0xff069e79),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff069e79), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    validateAndSubmit(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Color(0xff069e79),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    )),
                SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 290,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.facebook))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(signupScreen);
                        },
                        child: Text(
                          'SignUp',
                          style:
                              TextStyle(color: Color(0xff069e79), fontSize: 17),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //============================================================================
  void validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');
        var result =
            await _userService.signIn(email.text.trim(), password.text.trim());
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'No user found for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No user found for this email.'),
          ));
        } else if (result == 'Wrong password provided for that user.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password provided for this user.'),
          ));
        } else if (result == "This isn't an email") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("This isn't an email"),
          ));
        } else if (result.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Enter your email and password'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context).pushNamed(homeScreen);
        }
      }
    } else {
      internetConnectionDialog(context);
    }
  }
}
