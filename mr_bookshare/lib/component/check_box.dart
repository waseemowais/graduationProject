// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CheckBoxView extends StatefulWidget{

  const CheckBoxView({Key? key}) : super(key: key);

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {
  bool? isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: SizedBox(
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              activeColor: Color(0xff069e79),
              onChanged: (bool?b){
                setState((){
                  isChecked=b;
                });

              },
            ),
            Text("I agree to the"),
            TextButton(onPressed: (){}, child:Text("Terms & conditions",style: TextStyle(decoration: TextDecoration.underline,color: Color(0xff069e79),fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}
