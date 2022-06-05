import 'dart:developer';

class UserModel {
  String? uid;
  String? fullName;
  String? major;
  String? email;
  String? password;
  bool? loginState;
  bool? state;
  String? imageUrl;



  UserModel.empty();
  UserModel(
      {this.uid,
        this.fullName,
        this.email,
        this.password,
        this.loginState,
        this.state,
        this.imageUrl,
        this.major
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    loginState = json['loginState'];
    state = json['state'];
    imageUrl = json['imageUrl'];
    major = json['major'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['loginState'] = loginState;
    data['state'] = state;
    data['imageUrl'] = imageUrl;
    data['major'] = major;
    return data;
  }
}

class UserList {
  List<UserModel> users;

  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> data) {
    log('all data3 : ${data[0]['id']}');
    List<UserModel> userList = [];
    userList = data.map((element) {
      log('all data4 : ${element['id']}');
      return UserModel.fromJson(Map<String, dynamic>.from(element));
    }).toList();
    return UserList(users: userList);
  }
}
