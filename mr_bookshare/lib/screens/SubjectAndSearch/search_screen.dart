// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/subjectsview.dart';
import 'package:mr_bookshare/core/Models/postmodel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  final TextEditingController _search2 = TextEditingController();
  late PostList postList;

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
                  height: 120,
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
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 270,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                inputText = val;
                                print(inputText);
                              });
                            },
                            controller: _search2,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Color(0xff069e79),
                                  size: 28,
                                ),
                                onPressed: () {},
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.keyboard_voice_sharp),
                                onPressed: () {},
                              ),
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Search your subject',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff069e79), width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff069e79), width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // _buildSearchFld(),
                  ]),
                ),
              ),
            ],
          )),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .where('subjectName', isGreaterThanOrEqualTo: inputText)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Something went wrong ",
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading"),
                    );
                  }
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return SubjectView(
                        bookName: data['subjectName'],
                        writerName: data['writerName'],
                        image: data['image'],
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                    description: data['description'],
                                    title: 'Description',
                                    image: 'assets/images/book.gif',
                                  ));
                        },
                        fileUrl: data['FileModel']['url'],
                        downLoadUrl: () {
                          downLoadFile(data['FileModel']['url'],
                              data['FileModel']['name']);
                        },
                        createdDate: data['FileModel']['createdDate'],
                      );
                    }).toList(),
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<File?> downLoadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
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
