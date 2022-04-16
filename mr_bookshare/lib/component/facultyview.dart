import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key,required this.color,required this.icon,required this.text, required this.textarabic}) : super(key: key);
  final Color color;
  final String text;
  final String textarabic;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 6,
        color:color,
        child: Padding(
          padding: const EdgeInsets.only(left: 4,right: 4),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,style: const TextStyle(fontSize: 25,color: Colors.white),),
                  Text(textarabic,style: const TextStyle(fontSize: 15,color: Colors.white),),
                  SizedBox(width: 20,),
                  Icon(icon,color: Colors.white,size: 40,),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}