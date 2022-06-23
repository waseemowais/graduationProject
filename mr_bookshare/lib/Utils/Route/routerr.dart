// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/screens/Profiles/editprofile_screen.dart';
import 'package:mr_bookshare/screens/Profiles/profile_screen.dart';

import 'package:mr_bookshare/screens/Registeration/login.dart';
import 'package:mr_bookshare/screens/Registeration/signup.dart';
import 'package:mr_bookshare/screens/Splashes/instuctions.dart';
import 'package:mr_bookshare/screens/Splashes/splash_screen.dart';

import '../../screens/Home/homeview.dart';
import '../../component/image_viewer.dart';
import '../../screens/SubjectAndSearch/search_screen.dart';

import '../../screens/SubjectAndSearch/SubjectsScreen.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        {
          return _route(SplashScreen());
        }
      case instructions:
        {
          return _route(Instructions());
        }
      case loginScreen:
        {
          return _route(LoginScreen());
        }
      case signupScreen:
        {
          return _route(SignUpScreen());
        }
      case homeScreen:
        {
          return _route(HomeView());
        }
      case profileScreen:
        {
          // final arg = settings.arguments as UserModel;
          return _route(ProfileScreen());
        }
      case editprofileScreen:
        {
          return _route(EditProfile());
        }
      case subjectScreen:
        {
          // final arg = settings.arguments as String;
          return _route(SubjectScreen());
        }
      case searchScreen:
        {
          return _route(SearchScreen());
        }
      case imageViewer:
        {
          final arg = settings.arguments as String;
          return _route(ImageViewerScreen(
            imageUrl: arg,
          ));
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
