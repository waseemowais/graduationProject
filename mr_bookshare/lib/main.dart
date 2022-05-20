import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/Route/routerr.dart';
import 'package:mr_bookshare/screens/Registeration/login.dart';
import 'package:mr_bookshare/screens/Registeration/signup.dart';
import 'package:mr_bookshare/screens/editprofile_screen.dart';
import 'package:mr_bookshare/screens/major_view.dart';
import 'package:mr_bookshare/screens/homeview.dart';
import 'package:mr_bookshare/screens/profile_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
      home:  MajorScreen(),
    );
  }
}
