// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/core/Provider/user_provider.dart';

import '../component/informationview.dart';
import '../core/Models/user_model.dart';
import '../core/services/user_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel? userModel;
  final UserService _userService = UserService();
  final UserProvider _userProvider = UserProvider();
  final _fullName = TextEditingController();
  final _major = TextEditingController();
  final _password = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = {};
    userData = UserService().getUserData();
    return FutureBuilder(
        future: _userService.getUser(widget.uid),
        builder: (ctx, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          userModel = data as UserModel;
          // _fullName.text = userModel!.fullName!;
          // _password.text = userModel!.password!;
          // _major.text = userModel!.major!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 12, left: 5),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Color(0xff069e79),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'cancel',
                      style: TextStyle(color: Color(0xff069e79), fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            body: Stack(
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
                                EditTextView(
                                  labeltext: 'Name',
                                  hint: 'Name',
                                  controller: _fullName,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                EditTextView(
                                  labeltext: 'password',
                                  hint: 'password',
                                  controller: _password,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                EditTextView(
                                  labeltext: 'Study major',
                                  hint: 'Study major',
                                  controller: _major,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: RaisedButton(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none
                                    ),
                                    color: Colors.white,
                                    child: const Text(
                                      'Update',
                                      style:
                                          TextStyle(color: Color(0xff069e79)),
                                    ),
                                    onPressed: () async {
                                      var model = UserModel(
                                        uid: widget.uid,
                                        fullName: _fullName.text,
                                        major: _major.text,
                                        password: _password.text,
                                        state: userModel!.state,
                                        loginState: userModel!.loginState,
                                        imageUrl: userModel!.imageUrl,
                                        email: userModel!.email,
                                      );
                                      await _userProvider
                                          .updateUser(widget.uid, model).then((value) => (
                                          currentUser!.updatePassword(_password.text)
                                      ))
                                          .whenComplete(() {
                                        simpleDialogToUse(
                                            context, 'Data Update Completed');
                                      });
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
        });
  }
}
