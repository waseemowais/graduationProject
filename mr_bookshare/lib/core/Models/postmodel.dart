class PostModel {
  String? id;
  String? subjectName;
  String? writerName;
  String? image;
  String? description;
  FileModel? fileModel;

  PostModel(
      {this.id,
        this.subjectName,
        this.writerName,
        this.image,
        this.description,
        this.fileModel});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectName = json['subjectName'];
    writerName = json['writerName'];
    image = json['image'];
    description = json['description'];
    fileModel = json['FileModel'] != null
        ?  FileModel.fromJson(json['FileModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['subjectName'] = subjectName;
    data['writerName'] = writerName;
    data['image'] = image;
    data['description'] = description;
    if (fileModel != null) {
      data['FileModel'] = fileModel!.toJson();
    }
    return data;
  }
}

class FileModel {
  String? id;
  String? name;
  String? url;
  String? createdDate;

  FileModel({this.id, this.name, this.url, this.createdDate});

  FileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['createdDate'] = createdDate;
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