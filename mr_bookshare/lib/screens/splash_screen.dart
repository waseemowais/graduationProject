import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
                colors: [Color(0xff069e79),Color(0xff069e79),Colors.white30],
              )),
        ),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            // const Text('Yarmouk University',style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/Yarmouk-logo.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Mr.BookShare',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
            ),
            //should be animated
            const SizedBox(
              height: 250,
            ),
            RaisedButton(
                color: Colors.white,
                child: Text(
                  'START',
                  style: TextStyle(
                    color: Color(0xff069e79),
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(homeScreen);
                })
          ],
        )
      ]),
    );
  }
}
