// ignore_for_file: prefer_const_constructors

import 'dart:ui';


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:mr_bookshare/Utils/Route/const.dart';


import '../homeview.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff069E79),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           Expanded(
//             flex: 2,
//             child: AnimatedSplashScreen.withScreenFunction(
//               splash: 'assets/images/Yarmouk-logo.png',
//               splashIconSize: 250,
//               backgroundColor: Color(0xFF069E79),
//               screenFunction: () async {
//                 var loginState = Prefs.getBooleanValue('loginState') ?? false;
//                 await delay();
//                 if (loginState) {
//                   return const HomeView();
//                 } else {
//                   return const Instructions();
//                 }
//               },
//               splashTransition: SplashTransition.fadeTransition,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: DefaultTextStyle(
//               style: const TextStyle(fontSize: 30.0, color: Colors.white),
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   WavyAnimatedText('Mr.BookShare App'),
//                 ],
//                 isRepeatingAnimation: true,
//                 onTap: () {},
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// Future<void> delay() async {
//   Future.delayed(
//     const Duration(seconds: 5),
//   );
// }
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
          ],
        )
      ]),
    );
  }
}
