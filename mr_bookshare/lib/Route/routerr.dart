// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/screens/homeview.dart';
import 'package:mr_bookshare/screens/splash_screen.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        {
          return _route(SplashScreen());
        }
      case homeScreen:
        {
          return _route(Analytics());
        }
      default:
        {
          final arg = settings.name as String;
          return _route(UnDefineView(routeName: arg));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

class UnDefineView extends StatelessWidget {
  const UnDefineView({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text(
          routeName,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
