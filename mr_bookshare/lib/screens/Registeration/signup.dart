// ignore_for_file: prefer_const_constructors, unnecessary_const, prefer_const_literals_to_create_immutables

import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/Utils/loader.dart';
import 'package:mr_bookshare/component/check_box.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/internet_connection_dialog.dart';
import 'package:mr_bookshare/core/services/connectivity_service.dart';
import 'package:mr_bookshare/core/services/user_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final major = TextEditingController();

  bool? isChecked = false;
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'SignUp',
                  style:
                      const TextStyle(fontSize: 30, color: Color(0xff069e79)),
                ),
                const SizedBox(
                    width: 200,
                    child: Icon(
                      Icons.app_registration,
                      color: Color(0xff069e79),
                      size: 110,
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: fullName,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your full name',
                      suffixIcon: const Icon(Icons.person_outlined,
                          color: const Color(0xff069e79)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: major,
                    decoration: InputDecoration(
                      labelText: 'Major',
                      labelStyle: const TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your major',
                      suffixIcon: const Icon(Icons.book_outlined,
                          color: const Color(0xff069e79)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your Email',
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: const Color(0xff069e79),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
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
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Color(0xff069e79)),
                      hintText: 'Enter your password',
                      suffixIcon: const Icon(
                        Icons.password_outlined,
                        color: Color(0xff069e79),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, top: 20),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: Color(0xff069e79),
                          onChanged: (bool? b) {
                            setState(() {
                              isChecked = b;
                              color = !color;
                            });
                          },
                        ),
                        Text("I agree to the"),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                        description:
                                            'The copyright symbol consists of a letter “c” in a circle, followed by the name of the owner of the copyright and the year the work was first published. For example, the copyright symbol, followed by Jane Doe, comma, 1999, indicates that Jane Doe is the author of the work that was first published in 1999.'
                                                '\n And We are not responsible for any copyrighted version posted or downloaded',
                                        title: 'Warning',
                                        image: 'assets/images/abcca7_fcf2d4b88bb94a13b0fc2991c0874b02_mv2.gif',
                                      ));
                            },
                            child: Text(
                              "Terms & conditions",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff069e79),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {
                    if (isChecked!) {
                      validateAndSubmit(context);
                    }
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: color ? Color(0xff069e79) : Colors.grey,
                  // Color(0xff069e79),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                ),
                const SizedBox(
                  height: 6,
                ),
                const SizedBox(
                  width: 290,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account!"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(loginScreen);
                        },
                        child: const Text(
                          'Login',
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

  Future<void> validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');

        var userValues = HashMap();
        userValues['email'] = email.text.trim();
        userValues['fullName'] = fullName.text.trim();
        userValues['password'] = password.text.trim();
        userValues['major'] = major.text.trim();

        var result = await _userService.signUp(userValues);
        log(result);
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'The password provided is too weak.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('The password provided is too weak(at least 8 numbers).'),
          ));
        } else if (result == 'The account already exists for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.'),
          ));
        } else if (result == "This isn't an email") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("This isn't an email"),
          ));
        } else if (result.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Enter your personal information'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context).pushNamed(homeScreen, arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }

  void displayMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content: Column(
              children: [
                Text('you have accepted the terms .'),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
          return dialog;
        });
  }
}
//================================check box======================================

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
