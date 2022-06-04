// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
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

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 12, left: 5),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xff069e79),
                  ),
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
                        height: 60,
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none),
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
                                          .updateUser(widget.uid, model)
                                          .then((value) => (currentUser!
                                              .updatePassword(_password.text)))
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
