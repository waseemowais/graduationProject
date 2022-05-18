// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';
import 'package:mr_bookshare/component/dialog_view.dart';
import 'package:mr_bookshare/component/subjectsview.dart';
import 'package:mr_bookshare/screens/major_view.dart';

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
      body: SingleChildScrollView(
        child: Column(
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

                              IconButton(
                                onPressed: (){
                                  Navigator.of(context).pushNamed(majorScreen);
                                },
                                icon:Icon(Icons.arrow_back_ios, size: 35,),
                                color: Colors.white,

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
                                  color: Color(0xff069e79),
                                  size: 28,
                                ),
                                suffixIcon: Icon(
                                  Icons.keyboard_voice,
                                  color:Color(0xff069e79),
                                  size: 28,
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
            Column(
              children: [
                SubjectView(
                    bookName: 'Algorithms',
                    writerName: "Added by: Omar Afaneh",
                  ontap: () {
                      showDialog(context: context, builder: (context){
                        return CustomDialog( description:'is a finite sequence of well-defined instructions, typically used to solve a class of specific problems or to perform a computation');

                      });
                  },
                    image:
                    "https://images-na.ssl-images-amazon.com/images/I/41Lugv4F3YL._SX415_BO1,204,203,200_.jpg",),
                SubjectView(
                    bookName: 'Data structure',
                    writerName: "Added by: Waseem Owais",
                    ontap: () {  },
                    image:
                    "https://media.wiley.com/product_data/coverImage300/75/04703832/0470383275.jpg",),
                SubjectView(
                    bookName: 'Python',
                    writerName: "Added by: Mhamad alomari",
                    ontap: () {  },
                    image:
                    "https://images-na.ssl-images-amazon.com/images/I/41hGo6CTPqL._SY445_SX342_QL70_ML2_.jpg",),
              ],
            )
          ],
        ),
      ),
    );
  }
}
