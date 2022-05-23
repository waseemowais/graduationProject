import 'package:flutter/foundation.dart';

class PostModel extends ChangeNotifier {
  String? subjectName;
  String? writerName;
  String? image;
  String? id;

  PostModel({this.id, this.subjectName, this.writerName, this.image});

  PostModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    writerName = json['writerName'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectName'] = subjectName;
    data['writerName'] = writerName;
    data['image'] = image;
    data['id'] = id;
    return data;
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
