// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/component/facultyview.dart';
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/screens/Registeration/login.dart';
import 'package:mr_bookshare/screens/profile_screen.dart';
import 'package:mr_bookshare/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff069e79),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [IconButton(
          icon: const Icon(Icons.logout,color:Color(0xff069e79) ,),
          onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,duration:Duration(seconds: 1), child: SplashScreen()));
          },
        ),],
        leading: InkWell(
          onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration:Duration(seconds: 1), child: ProfileScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/4,
              height: MediaQuery.of(context).size.width/4,
              decoration: BoxDecoration(
                  border: Border.all(color:Color(0xff069e79),width:3),
                  shape: BoxShape.circle,
                  color: Color(0xff069e79),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQElF2rGbinBUQ/profile-displayphoto-shrink_200_200/0/1636412301461?e=1654732800&v=beta&t=_sGkrOYsffDgd8hZC7clC7wxGS-qIk0oiChwRL5dVfw'),
                  )
              ),
            ),
          ),
        ),
      ),
      body: Stack(
          alignment: Alignment.center,
          children: [
        CustomPaint(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          painter: Header(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello Waseem,',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff069e79),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find a Course you want to learn',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff069e79),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300,
        ),
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 2),
              child: Row(
                children: const [
                  Text('Faculteis',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب'),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
