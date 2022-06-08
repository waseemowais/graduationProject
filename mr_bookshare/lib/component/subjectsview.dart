// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SubjectView extends StatelessWidget {
  final String bookName;
  final String writerName;
  final VoidCallback ontap;
  final String image;
  final String fileUrl;
  final VoidCallback downLoadUrl;

  const SubjectView(
      {Key? key,
      required this.bookName,
      required this.writerName,
      required this.image,
      required this.ontap,
       required this.fileUrl, required this.downLoadUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: InkWell(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(image),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        bookName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Text(
                        writerName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      IconButton(
                          onPressed: downLoadUrl,
                          icon: Icon(
                            Icons.download_rounded,
                            size: 35,
                            color: Color(0xff069e79),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

// Widget buildSubjectView(BuildContext context, DocumentSnapshot document) {
//   final mod = PostModel.fromSnapshot(document);
//
//   return Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(left: 12, right: 12),
//         child: InkWell(
//           onTap: (){},
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 7, bottom: 7),
//                   child: SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: Image.network(mod.image!),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       mod.subjectName!,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//                     Text(
//                       mod.writerName!,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.download_rounded,
//                           size: 35,
//                           color: Color(0xff069e79),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 20,
//       )
//     ],
//   );
// }
