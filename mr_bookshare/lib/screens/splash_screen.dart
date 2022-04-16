import 'dart:ui';

import 'package:flutter/material.dart';


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
              image: DecorationImage(
                  image: AssetImage('assets/images/yarmouk-background.jpg'),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.0)),
              ),
            )),
        Column(
          children: [
            const SizedBox(height: 60,),
            const Text('Yarmouk University',style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 200,
                  width: 200,
                  child: Image.asset('assets/images/Yarmouk-logo.png'),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Mr.BookShare',style:  TextStyle(fontSize: 30,),),
             const SizedBox(height: 250,),
            RaisedButton(
              color: Colors.black12,
                child: Text('START',style: TextStyle(color: Colors.white),),

                onPressed: (){}
            )

          ],
        )
      ]),
    );
  }
}



