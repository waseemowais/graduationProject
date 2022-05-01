import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/screens/profile_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../component/informationview.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 5,left: 5),
          child: InkWell(
            onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration:Duration(seconds: 1), child: ProfileScreen()));
            },
            child: Text('Cancel',style: TextStyle(color:  Color(0xff069e79),fontSize: 15),),
          ),
        ),
      ),
      body:  Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xff069e79),
                      Color(0xff069e79),
                      Colors.white,
                    ],
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Color(0xff069e79),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://media-exp1.licdn.com/dms/image/C4E03AQElF2rGbinBUQ/profile-displayphoto-shrink_200_200/0/1636412301461?e=1654732800&v=beta&t=_sGkrOYsffDgd8hZC7clC7wxGS-qIk0oiChwRL5dVfw'),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: const Text(
                      'Change profile photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const EditTextView(
                              labeltext: 'Name',
                              hint: 'Name',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const EditTextView(
                              labeltext: 'Email',
                              hint: 'Email',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const EditTextView(
                              labeltext: 'Study major',
                              hint: 'Study major',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 400,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.white,
                                child: const Text(
                                  'Done',
                                  style: TextStyle(color: Color(0xff069e79)),
                                ),
                                onPressed: () {
                                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration:Duration(seconds: 1), child: ProfileScreen()));
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
    
    );
  }
}
