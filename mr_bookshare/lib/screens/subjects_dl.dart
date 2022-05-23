// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/subjectsview.dart';
import 'package:provider/provider.dart';

import '../core/Models/postmodel.dart';
import '../core/Provider/post_provider.dart';

class SubjectsDl extends StatefulWidget {
  const SubjectsDl({Key? key}) : super(key: key);


  @override
  _SubjectsDlState createState() => _SubjectsDlState();
}

class _SubjectsDlState extends State<SubjectsDl> {

  final search = TextEditingController();
  PostList? postList;
  PostProvider postProvider = PostProvider();

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
                      padding:
                      const EdgeInsets.only(top: 30, left: 20, right: 20),
                      height: 175,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xff069e79),
                          Color(0xff069e79),
                        ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
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
                                size: 35,
                              ),
                              color: Colors.white,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     top: 13.0, left: 10,),
                            //   child: Text(
                            //     widget.name,
                            //     style: TextStyle(
                            //         color: Colors.white, fontSize: 20),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // _buildSearchFld(),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: search,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xff069e79),
                                size: 28,
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
                      ]),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
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
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: postList!.posts.length,
                  itemBuilder: (ctx, index) {
                    var item = postList!.posts[index];
                    return SubjectView(bookName: item.subjectName!,
                        writerName: item.writerName!,
                        image: item.image!,
                        ontap: (){});
                  },
                  // children: [
                  //   SubjectView(
                  //     bookName: 'Algorithms',
                  //     writerName: "Added by: Omar Afaneh",
                  //     ontap: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (context) {
                  //             return CustomDialog(
                  //                 description:
                  //                 'is a finite sequence of well-defined instructions, typically used to solve a class of specific problems or to perform a computation');
                  //           });
                  //     },
                  //     image:
                  //     "https://images-na.ssl-images-amazon.com/images/I/41Lugv4F3YL._SX415_BO1,204,203,200_.jpg",
                  //   ),
                  //   SubjectView(
                  //     bookName: 'Data structure',
                  //     writerName: "Added by: Waseem Owais",
                  //     ontap: () {},
                  //     image:
                  //     "https://media.wiley.com/product_data/coverImage300/75/04703832/0470383275.jpg",
                  //   ),
                  //   SubjectView(
                  //     bookName: 'Python',
                  //     writerName: "Added by: Mhamad alomari",
                  //     ontap: () {},
                  //     image:
                  //     "https://images-na.ssl-images-amazon.com/images/I/41hGo6CTPqL._SY445_SX342_QL70_ML2_.jpg",
                  //   ),
                  // ],
                );
              }
          )
        ],
      ),
    );
  }
}
