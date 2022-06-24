import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mr_bookshare/core/Models/user_model.dart';
import 'package:mr_bookshare/core/services/user_service.dart';
import 'package:mr_bookshare/core/session_manager/session_manager.dart';

class UserProvider extends ChangeNotifier {
  final UserService userService = UserService();
  final String prefsName = 'usersData';

  Future<UserList> get users async {
    late UserList userList;
    await userService.getUsers().then((value) {
      userList = value;
    });
    if (userList.users.isEmpty) {
      return UserList(users: []);
    } else {
      return userList;
    }
  }

  Future<UserModel> updateUser(String id, UserModel model) async {
    return await userService.updateUser(id, model).whenComplete(() {
      log('update user done');
      notifyListeners();
      refreshModel(model);
      refresh();
    }).catchError((err) {
      log('update user error : $err');
    });
  }

  Future<UserModel> getUser(String id) async {
    return await userService.getUser(id).whenComplete(() {
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('$err');
    });
  }

  void refresh() async {
    await Prefs.removeValue(prefsName);
    UserList model;
    String encodedData = '';
    List<String> encodedDataList = [];
    model = await userService.getUsers();
    for (var item in model.users) {
      encodedData = json.encode(item.toJson());
      encodedDataList.add(encodedData);
    }
    Prefs.setStringList(prefsName, encodedDataList); // background service
  }

  void refreshModel(UserModel model) async {
    await Prefs.removeValue('fullName');
    await Prefs.removeValue('email');
    await Prefs.removeValue('major');
    await Prefs.removeValue('imageUrl');

    await Prefs.setStringValue('fullName', model.fullName!);
    await Prefs.setStringValue('email', model.email!);
    await Prefs.setStringValue('major', model.major!);
    await Prefs.setStringValue('imageUrl', model.imageUrl!);
  }
}
