import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PostModel extends ChangeNotifier {
  String? subjectName;
  String? writerName;
  String? image;
  String? id;
  String? description;
  String? fileUrl;

  PostModel({this.id, this.subjectName, this.writerName, this.image,this.description,this.fileUrl});

  PostModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    writerName = json['writerName'];
    image = json['image'];
    id = json['id'];
    description = json['description'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectName'] = subjectName;
    data['writerName'] = writerName;
    data['image'] = image;
    data['id'] = id;
    data['description'] = description;
    data['fileUrl'] = fileUrl;
    return data;
  }
  PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    subjectName = snapshot['subjectName'];
    writerName = snapshot['writerName'];
    image = snapshot['image'];
    id = snapshot['id'];
    description = snapshot['description'];
    fileUrl = snapshot['fileUrl'];

  }
}


class PostList {
  List<PostModel> posts;

  PostList({required this.posts});

  factory PostList.fromJson(List<dynamic> data) {
    List<PostModel> dataList = [];
    dataList = data.map((e) {
      return PostModel.fromJson(Map<String, dynamic>.from(e));
    }).toList();
    return PostList(posts: dataList);
  }
}
