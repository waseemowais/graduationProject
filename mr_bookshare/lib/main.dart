import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/Route/routerr.dart';

import 'package:mr_bookshare/test.dart';


<<<<<<< HEAD
void main() {
  runApp(const Test());
=======
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
>>>>>>> 793f25c482df296937a6bf9ac886eb6dc27a0d5b
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
