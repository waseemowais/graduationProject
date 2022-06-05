// ignore_for_file: prefer_const_constructors

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
  const EditTextView({Key? key,required this.hint,required this.labeltext, required this.controller}) : super(key: key);
  final String hint;
  final String labeltext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
//==================================for upload subject==========================
class SubjectTextFielView extends StatefulWidget {
  const SubjectTextFielView({Key? key,required this.hint, required this.controller}) : super(key: key);
  final String hint;
  final TextEditingController controller;

  @override
  State<SubjectTextFielView> createState() => _SubjectTextFielViewState();
}

class _SubjectTextFielViewState extends State<SubjectTextFielView> {


  String? validate(String? value){
    if(widget.controller.text.isEmpty){
      return 'Required Field';
    }else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color:Color(0xff069e79)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
             BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xff069e79), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none
          )
      ),
    );
  }
}
//==================for Description textfiel====================================

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({Key? key,required this.hint,required this.labeltext, required this.controller}) : super(key: key);
  final String hint;
  final String labeltext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 2,
      maxLines: 100,
      controller: controller,
      decoration: InputDecoration(
          label:Text(labeltext,style: TextStyle(color:Color(0xff069e79)),) ,
          hintText: hint,
          hintStyle: TextStyle(
              color:Color(0xff069e79)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xff069e79), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none
          )
      ),
    );
  }
}