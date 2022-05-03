
import 'package:flutter/material.dart';
class FacultyModel extends ChangeNotifier {
  String? id;
  String? name;


  FacultyModel({this.id, this.name, });

  FacultyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
//==============================================================================
// class FacultyList{
//   List<FacultyModel>faculty;
//   FacultyList({required this.faculty});
//
//   factory FacultyList.fromJson(List<dynamic>data){
//     List<FacultyModel>datalist=[];
//     datalist=data.map((e) {
//       return FacultyModel.fromJson(Map<String,dynamic>.from(e));
//
//     }).toList();
//     return FacultyList(faculty: datalist);
//   }
// }
//===============================================================================
class FacultyList {
  static List<FacultyModel> faculty = [
    FacultyModel(
        name:'Computer Science'
    ), FacultyModel(
        name:'Computer information systems'
    ), FacultyModel(
        name:'Cyber security'
    ), FacultyModel(
        name:'Artificial intelligence'
    ), FacultyModel(
        name:'Business information technology'
    ),
  ];
}