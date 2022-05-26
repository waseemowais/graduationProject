
import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key,required this.icon,required this.text,required this.onClicked}) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onClicked,
        child: buildContect(),
        style: ElevatedButton.styleFrom(
            primary:Color(0xff069e79)
        ),
      ),
    );


  }
  Widget buildContect()=>Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon,size: 28,),
      const SizedBox(width: 16,),
      Text(
        text,
      )
    ],
  );
}