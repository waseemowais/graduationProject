// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, override_on_non_overriding_member, unnecessary_null_comparison

import 'dart:io';

import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/subjectsview.dart';
import 'add_post_dialog_screen.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/Models/postmodel.dart';
import '../../core/Provider/post_provider.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  PostList? postList;
  PostProvider postProvider = PostProvider();
  final String collectionName = 'posts';
  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xff069e79),
                      Color(0xff069e79),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                          ),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AddPostDialog());
                          },
                          icon: Icon(
                            Icons.add_circle_outline_sharp,
                            size: 35,
                          ),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(searchScreen);
                          },
                          icon: Icon(
                            Icons.search,
                            size: 35,
                          ),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // _buildSearchFld(),
                  ]),
                ),
              ),
            ],
          )),
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: StreamBuilder(
                stream: postProvider.getPosts().asStream(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (data == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                        strokeWidth: 3,
                      ),
                    );
                  }
                  postList = data as PostList;


                  if (postList!.posts.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'OOPs\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'Not Item is Found\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: Container(
                      key: _key,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: postList!.posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = postList!.posts[index];

                            return SubjectView(
                              bookName: item.subjectName!,
                              writerName: item.writerName!,
                              image: item.image!,
                              ontap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CustomDialog(
                                          description: item.description!,
                                          image: 'assets/images/book.gif',
                                          title: 'Description',
                                        ));
                              },
                              fileUrl: item.fileModel!.url!,
                              downLoadUrl: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("It might take a few seconds"),
                                ));
                                downLoadFile(item.fileModel!.url!,
                                    item.fileModel!.name!);
                              },
                              createdDate: item.fileModel!.createdDate!,
                            );
                          }),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    if (mounted) {
      _key = GlobalKey();
      setState(() {});
    }
    Future.value(null);
  }

  // Future openFile({required String url, String? fileName}) async {
  //   final file = await downLoadFile(url, fileName!);
  //   if (file == null) return;
  //
  //   print('path: ${file.path}');
  //
  //   OpenFile.open(file.path);
  // }

  Future<File?> downLoadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            // to give more than one url
            followRedirects: false,
            //how long to receive data
            receiveTimeout: 0,
          ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      OpenFile.open(file.path);

      return file;
    } catch (e) {
      return null;
    }
  }
}
