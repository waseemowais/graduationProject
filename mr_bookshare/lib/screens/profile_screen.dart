// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';
import 'package:mr_bookshare/core/Provider/user_provider.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/component/informationview.dart';

import 'package:mr_bookshare/core/services/user_service.dart';
import 'package:provider/provider.dart';

import '../Utils/user_data_helper.dart';
import '../core/Models/user_model.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.model}) : super(key: key);
  UserModel model;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FilesUploadService _filesUploadService = FilesUploadService();
  final UserProvider _userProvider = UserProvider();
  ImagePicker picker = ImagePicker();
  File? _image;
  String imageUrl = '';
  final UserService _userService = UserService();
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context,listen: true);
    widget.model = getUserData();
    ImageProvider? imageProvider = (widget.model.imageUrl!.isNotEmpty
        ? NetworkImage(widget.model.imageUrl!)
        : AssetImage("assets/images/person_avatar.png"))
    as ImageProvider<Object>?;

    return FutureBuilder(
        future: _userService.getUser(widget.model.uid!),
        builder: (context, snapshot) {
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
            body: Stack(alignment: Alignment.center, children: [
              CustomPaint(
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
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
                  CircleAvatar(
                    backgroundImage: imageProvider,
                    maxRadius: 90,
                    minRadius: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_enhance_sharp,
                            size: 30,
                          ),
                          onPressed: () async {
                            var result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text('Chose your image option.'),
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Change your image',
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                });
                            if (result != null) {
                              if (result) {
                                // change his image
                                await chooseImage();
                                if (_image != null) {
                                  imageUrl = await _filesUploadService
                                      .fileUpload(_image!, 'UsersImage');
                                  if (imageUrl.isNotEmpty) {
                                    widget.model.imageUrl = imageUrl;
                                    log('${widget.model.imageUrl}');
                                    log(widget.model.password!);
                                    widget.model = UserModel(
                                      uid: widget.model.uid,
                                      fullName: widget.model.fullName,
                                      major: widget.model.major,
                                      password: widget.model.password,
                                      state: widget.model.state,
                                      loginState: widget.model.loginState,
                                      imageUrl: widget.model.imageUrl,
                                      email: widget.model.email,
                                    );

                                    await _userProvider.updateUser(
                                        widget.model.uid!, widget.model)
                                        .whenComplete(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Upload Completed')));
                                    });
                                  }


                                  log(imageUrl);
                                }
                              } else {
                                // view his image
                                Navigator.of(context).pushNamed(imageViewer,
                                    arguments: widget.model.imageUrl!.isEmpty
                                        ? 'assets/images/istockphoto-1223671392-612x612.jpg'
                                        : widget.model.imageUrl);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  Column(
                    children: [
                      InformationView(
                        txt: widget.model.fullName!,
                        icon: Icons.person_outlined,
                      ),
                      InformationView(
                        txt: widget.model.email!,
                        icon: Icons.email_outlined,
                      ),
                      InformationView(
                        txt: widget.model.major!,
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
                                  Navigator.of(context).pushNamed(
                                      editprofileScreen,
                                      arguments: widget.model);
                                })),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          );
        });
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile!.path.isEmpty) {
      retrieveLostData();
    } else {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.file != null) {
      setState(() {
        _image = File(response.file!.path);
      });
    } else {
      // log('response.file : ${response.file}');
    }
  }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff069e79);
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

class FilesUploadService {
  late Reference firebaseStorageRef;

  Future<String> fileUpload(File file, String valueName) async {
    String result = '';
    firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('$valueName/${path.basename(file.path)}');
    await firebaseStorageRef.putFile(file).whenComplete(() async {
      await firebaseStorageRef.getDownloadURL().then((value) {
        result = value;
      });
    });
    return result;
  }
}
