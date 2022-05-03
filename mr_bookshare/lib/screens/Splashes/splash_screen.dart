import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/screens/Registeration/login.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    _navigatetologin();
  }

  _navigatetologin()async{
    await Future.delayed(Duration(seconds: 6),(){});
    Navigator.of(context).pushNamed(instructions);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff069e79),
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            // const Text('Yarmouk University',style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/Yarmouk-logo.png'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 30.0, color:Colors.white),
              child: AnimatedTextKit(
                animatedTexts: [
                 WavyAnimatedText('Mr.BookShare App'),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
            //should be animated
            // const SizedBox(
            //   height: 250,
            // ),
            // RaisedButton(
            //     color: Colors.white,
            //     child: const Text(
            //       'START',
            //       style:  TextStyle(
            //         color: Color(0xff069e79),
            //         fontWeight: FontWeight.bold
            //       ),
            //     ),
            //     onPressed: () {
            //      Navigator.of(context).pushNamed(loginScreen);
            //     })
          ],
        )
      ]),
    );
  }
}
