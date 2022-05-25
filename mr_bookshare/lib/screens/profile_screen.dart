// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'dart:convert' as cnv;
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/core/Models/user_model.dart';
import 'package:mr_bookshare/core/Provider/user_provider.dart';
import 'package:mr_bookshare/core/services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int randomNumber = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = {};
    userData = UserService().getUserData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff069e79),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          refreshList;
        },
        child: Stack(alignment: Alignment.center, children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: Header(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4E03AQElF2rGbinBUQ/profile-displayphoto-shrink_200_200/0/1636412301461?e=1654732800&v=beta&t=_sGkrOYsffDgd8hZC7clC7wxGS-qIk0oiChwRL5dVfw'),
                    )),
              )
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 200, left: 150),
          //   child: CircleAvatar(
          //     backgroundColor: const Color(0xff069e79),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.edit,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Column(
                children: [
                  InformationView(
                    txt: userData['fullName'],
                    icon: Icons.person_outlined,
                  ),
                  InformationView(
                    txt: userData['email'],
                    icon: Icons.email_outlined,
                  ),
                  InformationView(
                    txt: userData['major'],
                    icon: Icons.book_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: SizedBox(
                        width: 500,
                        height: 40,
                        child: RaisedButton(
                            color: Color(0xff069e79),
                            child: Text(
                              'Edit Profile Here',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(editprofileScreen,arguments:userData['uid']);
                            })),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
  // Future<void> refreshList() async {
  //   refreshKey.currentState?.show(atTop: false);
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     randomNumber;
  //   });
  // }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff069e79);
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

