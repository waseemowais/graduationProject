import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mr_bookshare/component/facultyview.dart';

class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20, top: 50, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.menu),
              Icon(Icons.person_pin),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello Waseem,',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff069e79),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Find a Course you want to learn',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff069e79),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,bottom: 2),
            child: Row(
              children: const [
                Text('Faculteis',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff069e79),
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,

              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Color(0xff069e79),
                        icon: Icons.medical_services_outlined,
                        text: 'Medicin',
                        textarabic: 'الطب')),
                InkWell(
                  onTap: (){},
                  child: const DashboardCard(
                      color: Color(0xff069e79),
                      icon: Icons.medical_services_outlined,
                      text: 'Medicin',
                      textarabic: 'الطب'),
                ),
                InkWell(
                  onTap: (){},
                  child: const DashboardCard(
                      color: Color(0xff069e79),
                      icon: Icons.medical_services_outlined,
                      text: 'Medicin',
                      textarabic: 'الطب'),
                ),
                DashboardCard(
                    color: Color(0xff069e79),
                    icon: Icons.medical_services_outlined,
                    text: 'Medicin',
                    textarabic: 'الطب'),
                DashboardCard(
                    color: Color(0xff069e79),
                    icon: Icons.medical_services_outlined,
                    text: 'Medicin',
                    textarabic: 'الطب'),
                DashboardCard(
                    color: Color(0xff069e79),
                    icon: Icons.medical_services_outlined,
                    text: 'Medicin',
                    textarabic: 'الطب'),
                DashboardCard(
                    color: Color(0xff069e79),
                    icon: Icons.medical_services_outlined,
                    text: 'Medicin',
                    textarabic: 'الطب'),
                DashboardCard(
                    color: Color(0xff069e79),
                    icon: Icons.medical_services_outlined,
                    text: 'Medicin',
                    textarabic: 'الطب'),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
