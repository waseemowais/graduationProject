
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mr_bookshare/component/Button_view_for_dialog.dart';
import 'package:mr_bookshare/component/informationview.dart';
import 'package:mr_bookshare/core/Models/postmodel.dart';
import 'package:mr_bookshare/core/Provider/post_provider.dart';
import 'package:uuid/uuid.dart';
class AddPostDialog extends StatelessWidget {
  AddPostDialog({Key? key,}) : super(key: key);
  final _fullName = TextEditingController();
  final _subjectName = TextEditingController();
  final _description = TextEditingController();
  final _image = TextEditingController();
  PostProvider _postProvider = PostProvider();

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
              top: 10,
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
          child:SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SubjectTextFielView(labeltext: 'name', hint: 'name', controller: _fullName,),
                const SizedBox(height: 10,),
                SubjectTextFielView(labeltext: 'Subject Name', hint: 'Subject Name', controller: _subjectName,),
                const SizedBox(height: 10,),
                SubjectTextFielView(labeltext: 'image', hint: 'image URL', controller: _image,),
                const SizedBox(height: 10,),
                DescriptionTextField(labeltext: 'Description', hint: 'Description', controller: _description,),
                const SizedBox(height: 10,),
                ButtonWidget(icon: Icons.attach_file, text:'select file', onClicked: (){},),
                const Text(
                  'No Uploaded file',
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                  ),
                ),
                ButtonWidget(icon: Icons.upload_outlined, text:'Upload file', onClicked:(){},),
                Align(
                  alignment: Alignment.bottomRight,
                  child:FlatButton(
                    onPressed: () async{
                      var id = Uuid().v4();
                      var model = PostModel(
                        id: id,
                        writerName: _fullName.text,
                        subjectName: _subjectName.text,
                        description: _description.text,
                        image: _image.text,
                      );
                      await _postProvider.addPost(model).whenComplete(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child:  Text('Share',style: TextStyle(color: Color(0xff069e79)),),
                  ) ,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
