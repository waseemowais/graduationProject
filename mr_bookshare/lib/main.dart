import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/Route/routerr.dart';

import 'package:mr_bookshare/test.dart';


void main() {
  runApp(const Test());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: splashScreen,
    );
  }
}

//===============for test========================================================

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home:  SpeechScreen(),
    );
  }
}
