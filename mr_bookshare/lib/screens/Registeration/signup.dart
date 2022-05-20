
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/Utils/loader.dart';
import 'package:mr_bookshare/component/internet_connection_dialog.dart';
import 'package:mr_bookshare/core/services/connectivity_service.dart';
import 'package:mr_bookshare/core/services/user_service.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserService _userService=UserService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State>_keyLoader=GlobalKey<State>();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

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
                const Text('SignUp',style: const TextStyle(fontSize: 30,color: Color(0xff069e79)),),
                const SizedBox(
                  width: 200,
                  child: const Icon(Icons.app_registration,color:  Color(0xff069e79),size: 110,)
                ),
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
                      labelStyle:const TextStyle(
                          color: Color(0xff069e79)
                      ),
                      hintText: 'Enter your full name',
                      suffixIcon: const Icon(Icons.person_outlined,color: const Color(0xff069e79)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Full name required';
                    //   } else if (value.length < 3) {
                    //     return 'Name should be more than 3 letters';
                    //   } else if (!fullNameValidator(value)) {
                    //     return 'Enter valid full name';
                    //   }
                    //   return null;
                    // },
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
                      labelStyle:const TextStyle(
                          color: Color(0xff069e79)
                      ),
                      hintText: 'Enter your Email',
                      suffixIcon: const Icon(Icons.email_outlined,color:const Color(0xff069e79) ,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Email required';
                    //   } else if (!emailValidator(value)) {
                    //     return 'Enter Valid Email';
                    //   }
                    //   return null;
                    // },
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
                      labelStyle:const TextStyle(
                          color: Color(0xff069e79)
                      ),
                      hintText: 'Enter your password',
                      suffixIcon: const Icon(Icons.password_outlined,color: Color(0xff069e79),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return '* required';
                    //   } else if (value.length < 6) {
                    //     return 'Password should be at least 6 characters';
                    //   } else if (value.length > 15) {
                    //     return "Password should not be greater than 15 characters";
                    //   } else if (!passValidator(value)) {
                    //     return 'At least 1 character ,a number, a symbol and CAPITAL character ';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    validateAndSubmit(context);
                  },
                  child: const Text(
                    'SignUp',
                    style: const TextStyle(fontSize: 20),
                  ),
                  color:  const Color(0xff069e79),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                ),
                const SizedBox(
                  height: 6,
                ),

                const SizedBox(
                  width: 290,
                  child: const Divider(
                    thickness: 2,
                  ),
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
                          style: TextStyle(color: Color(0xff069e79),fontSize: 17),
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
        if(email.text.isEmpty&&password.text.isEmpty&&fullName.text.isEmpty){log('wrong');}
        else{
          var userValues = HashMap();
          userValues['email'] = email.text.trim();
          userValues['fullName'] = fullName.text.trim();
          userValues['password'] = password.text.trim();
          var result = await _userService.signUp(userValues);
          Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
              .pop();
          if (result == 'The password provided is too weak.') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('The password provided is too weak.'),
            ));
          } else if (result == 'The account already exists for that email.') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('The account already exists for that email.'),
            ));
          } else {
            log('uid2 : $result');
            Navigator.of(context).pushNamed(homeScreen, arguments: result);
          }
        }

      } else {
        internetConnectionDialog(context);
      }
    }
  }
}
