// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/component/subjectsview.dart';

class SubjectsDl extends StatefulWidget {
  const SubjectsDl({Key? key}) : super(key: key);

  @override
  _SubjectsDlState createState() => _SubjectsDlState();
}

class _SubjectsDlState extends State<SubjectsDl> {
  final search = TextEditingController();

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
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ('Welcome,\nWaseem Owais'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white70,
                          size: 35,
                        )
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
                            size: 28,
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_voice,
                            size: 28,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Search your subject',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black12, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff069e79), width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
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
        SingleChildScrollView(
          child: Column(
            children: [
              SubjectView(
                  bookName: 'Algorithms',
                  writerName: "Omar Afaneh",
                  image:
                  "https://images-na.ssl-images-amazon.com/images/I/41Lugv4F3YL._SX415_BO1,204,203,200_.jpg"),
              SubjectView(
                  bookName: 'Data structure',
                  writerName: "Waseem Owais",
                  image:
                  "https://media.wiley.com/product_data/coverImage300/75/04703832/0470383275.jpg"),
              SubjectView(
                  bookName: 'Python',
                  writerName: "محمد العمري",
                  image:
                  "https://images-na.ssl-images-amazon.com/images/I/41hGo6CTPqL._SY445_SX342_QL70_ML2_.jpg"),
            ],
          ),
        )
        ],
      ),
    );
  }
}
