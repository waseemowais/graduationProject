// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_bookshare/component/Button_view_for_dialog.dart';
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/core/Models/postmodel.dart';
import 'package:mr_bookshare/core/Provider/post_provider.dart';
import 'package:mr_bookshare/screens/Profiles/profile_screen.dart';
import 'package:uuid/uuid.dart';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

import '../../core/services/firebaseapi.dart';

class AddPostDialog extends StatefulWidget {
  const AddPostDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPostDialog> createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  final formKey = GlobalKey<FormState>();

  final _fullName = TextEditingController();

  final _subjectName = TextEditingController();

  final _description = TextEditingController();

  final _image = TextEditingController();

  final PostProvider _postProvider = PostProvider();

  UploadTask? task;

  File? file;

  String url = '';

  ImagePicker picker = ImagePicker();

  File? imageFile;

  String subjectImageUrl = '';

  bool selectImageColor = false;

  bool selectFileColor = false;

  final FilesUploadService _filesUploadService = FilesUploadService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 16, left: 16, right: 16),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ]),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SubjectTextFielView(
                    hint: 'name',
                    controller: _fullName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SubjectTextFielView(
                    hint: 'Subject Name',
                    controller: _subjectName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await chooseSubjectImage(ImageSource.camera);
                            if (imageFile != null) {
                              subjectImageUrl = await _filesUploadService
                                  .fileUpload(imageFile!, 'UsersImage')
                                  .whenComplete(() {
                                setState(() {
                                  selectImageColor = !selectImageColor;
                                });
                              });
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xff069e79),
                          )),
                      TextButton(
                        onPressed: () async {
                          await chooseSubjectImage(ImageSource.gallery);
                          if (imageFile != null) {
                            subjectImageUrl = await _filesUploadService
                                .fileUpload(imageFile!, 'UsersImage')
                                .whenComplete(() {
                              setState(() {
                                selectImageColor = !selectImageColor;
                              });
                            });
                          }
                        },
                        child: Text(
                          "Select Image",
                          style: TextStyle(color: Color(0xff069e79)),
                        ),
                      ),
                      Icon(
                        selectImageColor == false
                            ? Icons.check_circle_outline
                            : Icons.check_circle,
                        color: Color(0xff069e79),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionTextField(
                    labeltext: 'Description',
                    hint: 'Description',
                    controller: _description,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    icon: Icons.attach_file,
                    text: 'select file',
                    onClicked: selectFile,
                  ),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ButtonWidget(
                    icon: Icons.upload_outlined,
                    text: 'Upload file',
                    onClicked: uploadFile,
                  ),
                  SizedBox(height: 20),
                  task != null
                      ? buildUploadStatus(task!)
                      : Text(
                          'Upload a File(Image,PDF,Video)',
                          style: TextStyle(
                              color: selectFileColor == true
                                  ? Colors.red
                                  : Color(0xff069e79)),
                        ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (fileName == 'No File Selected') {
                            setState(() {
                              selectFileColor = !selectFileColor;
                            });
                          } else if(task==null){
                            setState(() {
                              selectFileColor = !selectFileColor;
                            });
                          }
                          else {
                            var id = Uuid().v4();
                            var model = PostModel(
                              id: id,
                              writerName: _fullName.text,
                              subjectName: _subjectName.text,
                              description: _description.text,
                              image: subjectImageUrl,
                              fileModel: FileModel(
                                id: Uuid().v4(),
                                url: url,
                                createdDate: DateTime.now().toString(),
                                name: DateTime.now().toString() + '_' +fileName
                              ),
                            );
                            await _postProvider.addPost(model).whenComplete(() {
                              Navigator.of(context).pop();
                            });
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Enter your post information'),
                          ));
                        }
                      },
                      child: Text(
                        'Share',
                        style: TextStyle(color: Color(0xff069e79)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    log('file name : $fileName');
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) {
      return;
    }
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url = urlDownload;
    });

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  chooseSubjectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile!.path.isEmpty) {
      retrieveLostData();
    } else {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.file != null) {
      setState(() {
        imageFile = File(response.file!.path);
      });
    } else {
      // log('response.file : ${response.file}');
    }
  }
}
