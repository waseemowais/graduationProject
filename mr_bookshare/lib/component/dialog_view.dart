import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key,required this.description,}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16
          ),
          margin:const EdgeInsets.only(top: 16) ,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow:const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0)
              )
            ]
          ),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Describtion',
                style: TextStyle(
                  color: Color(0xff069e79),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24,),
              Text(description,style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 24,),
              Align(
                alignment: Alignment.bottomRight,
                child:FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Close',style: TextStyle(color: Color(0xff069e79)),),
                ) ,
              )
            ],
          ),
        ),
        const Positioned(
          top: 0,
          left: 16,
          right: 16,
            child: CircleAvatar(
          foregroundImage: AssetImage('assets/images/book.gif'),
          radius: 50,
        ))
      ],
    );
  }
}
