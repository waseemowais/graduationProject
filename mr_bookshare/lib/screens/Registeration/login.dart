// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/screens/Registeration/signup.dart';
import 'package:mr_bookshare/screens/homeview.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 200,
                child: Icon(Icons.menu_book,color:  Color(0xff069e79),size: 100,),
              ),
              SizedBox(
                height: 30,
              ),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 30.0, color: Colors.black),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Welcome,Login'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {},
                ),
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
                    labelStyle:TextStyle(
                      color: Color(0xff069e79)
                    ),
                    hintText: 'Enter your Email',
                    suffixIcon: Icon(Icons.email_outlined,color: Color(0xff069e79),),
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
                    labelStyle:TextStyle(
                        color: Color(0xff069e79)
                    ),
                    hintText: 'Enter your password',
                    suffixIcon: const Icon(Icons.password_outlined,color: Color(0xff069e79) ,),
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
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(homeScreen);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                color:  Color(0xff069e79),
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
                        style: TextStyle(color: Color(0xff069e79),fontSize: 17),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
