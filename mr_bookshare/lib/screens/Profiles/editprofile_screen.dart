// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../../core/session_manager/user_data_helper.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/core/Models/user_model.dart';
import 'package:mr_bookshare/core/Provider/user_provider.dart';
import 'package:provider/provider.dart';


class EditProfile extends StatefulWidget {
   const EditProfile({Key? key}) : super(key: key);


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel? userModel;
  final _fullName = TextEditingController();
  final _major = TextEditingController();
  final _password = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context,listen: false);
    var tempUserModel = getUserData();
    // Map<String, dynamic> userData = {};
    // userData = UserService().getUserData();
    return FutureBuilder(
        future: userProvider.getUser(tempUserModel.uid!),
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
                                        uid: userModel!.uid,
                                        fullName: _fullName.text,
                                        major: _major.text,
                                        password: _password.text,
                                        state: userModel!.state,
                                        loginState: userModel!.loginState,
                                        imageUrl: userModel!.imageUrl,
                                        email: userModel!.email,
                                      );
                                      await userProvider
                                          .updateUser(userModel!.uid!, model)
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
