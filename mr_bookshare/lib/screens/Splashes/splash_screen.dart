// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:mr_bookshare/Utils/Route/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(seconds: 6), () {});
    Navigator.of(context).pushNamed(instructions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff069e79),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 260,
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/Yarmouk-logo.png'),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              DefaultTextStyle(
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Mr.BookShare App'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {},
                ),
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
