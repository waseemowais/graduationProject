// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/screens/Registeration/login.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 30.0, color: Colors.black),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('SignUp'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {},
                ),
              ),

              SizedBox(
                width: 200,
                child: Icon(Icons.person_add,color:  Color(0xff069e79),size: 110,)
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: fullName,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    suffixIcon: Icon(Icons.accessibility_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
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
              SizedBox(
                height: 17,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
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
                    hintText: 'Enter your password',
                    suffixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
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
                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration:Duration(seconds: 1), child: LoginScreen()));
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 20),
                ),
                color:  Color(0xff069e79),
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
              ),
              SizedBox(
                height: 6,
              ),

              SizedBox(
                width: 290,
                child: Divider(
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account!"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,duration:Duration(seconds: 1), child: LoginScreen()));
                      },
                      child: Text(
                        'Login',
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
