import 'package:flutter/material.dart';

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
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (_, controller) => Stack(
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
                  SizedBox(
                    height: 17,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            EditTextView(
                              labeltext: 'Name',
                              hint: 'Name',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            EditTextView(
                              labeltext: 'Email',
                              hint: 'Email',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            EditTextView(
                              labeltext: 'Study major',
                              hint: 'Study major',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 400,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  'Done',
                                  style: TextStyle(color: Color(0xff069e79)),
                                ),
                                onPressed: () {},
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
      ),
    );
  }
}
