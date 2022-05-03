import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/screens/editprofile_screen.dart';
import 'package:mr_bookshare/screens/homeview.dart';
import 'package:mr_bookshare/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff069e79),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushNamed(homeScreen);

          },
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
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
            Container(
              child: Column(
                children: [
                  const InformationView(
                    txt: 'owseem owais',
                    icon: Icons.person_outlined,
                  ),
                  const InformationView(
                    txt: 'owseemowais@ses.yu.edu.jo',
                    icon: Icons.email_outlined,
                  ),
                  const InformationView(
                    txt: ' Computer Science',
                    icon: Icons.book_outlined,
                  ),
                  const InformationView(
                    txt: '100 Items',
                    icon: Icons.share,
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
                          onPressed: (){
                            Navigator.of(context).pushNamed(editprofileScreen);
                          }
                          )
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
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
