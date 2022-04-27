import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  const InformationView({Key? key,required this.icon,required this.txt}) : super(key: key);
  final IconData icon;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon,color:Color(0xff069e79),),
            SizedBox(width: 10,),
            Text(txt,style: TextStyle(color: Color(0xff069e79),fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
//=====================edit information========================================
class EditTextView extends StatelessWidget {
  const EditTextView({Key? key,required this.hint,required this.labeltext}) : super(key: key);
  final String hint;
  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label:Text(labeltext,style: TextStyle(color:Colors.white),) ,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white
        ),
        fillColor: Colors.white30,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}
