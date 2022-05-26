// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// class SpeechScreen extends StatefulWidget {
//   const SpeechScreen({Key? key}) : super(key: key);
//
//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }
//
// class _SpeechScreenState extends State<SpeechScreen> {
//   final Map<String, HighlightedWord> _highlights = {
//     'flutter': HighlightedWord(
//       onTap: () => print('flutter'),
//       textStyle: const TextStyle(
//         color: Colors.blue,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'ahmed': HighlightedWord(
//       onTap: () => print('ahmed'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'like': HighlightedWord(
//       onTap: () => print('like'),
//       textStyle: const TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'it': HighlightedWord(
//       onTap: () => print('it'),
//       textStyle: const TextStyle(
//         color: Colors.blueAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'share': HighlightedWord(
//       onTap: () => print('share'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };
//
//
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press';
//   double _confidence = 1.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Voice To Text App'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: TextHighlight(
//             text: _text,
//             words: _highlights,
//             textStyle: const TextStyle(
//               fontSize: 50.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }
//=====================================Upload===================================
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mr_bookshare/component/informationview.dart';

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
//==============================================================================

class AddPostDialog extends StatelessWidget {
  AddPostDialog({Key? key,required this.description,}) : super(key: key);
  final String description;
  final _fullName = TextEditingController();
  final _subjectName = TextEditingController();
  final _description = TextEditingController();
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
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text('Share',style: TextStyle(color: Color(0xff069e79)),),
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

//============================================================================
class WhitePage extends StatefulWidget {
  const WhitePage({Key? key}) : super(key: key);

  @override
  _WhitePageState createState() => _WhitePageState();
}

class _WhitePageState extends State<WhitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton(
          onPressed: (){
            showDialog(context: context, builder: (context)=>AddPostDialog( description: 'hdhdhhdhd',));
          },
        ),
      ),
    );
  }
}
