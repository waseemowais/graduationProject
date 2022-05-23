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

  UserList get offlineUsers {
    var data = <UserModel>[];
    var encodedData = Prefs.getStringListValue(prefsName) ?? [];
    if (encodedData.isNotEmpty) {
      var model = UserModel.empty();
      for (var item in encodedData) {
        model = UserModel.fromJson(json.decode(item));
        data.add(model);
      }
      UserList finalModel = UserList(users: data);
      return finalModel;
    }
    return UserList(users: []);
  }



  Future<UserModel> updateUser(String id, UserModel model) async {
    return await userService.updateUser(id, model).whenComplete(() {
      log('update user done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('update user error : $err');
    });
  }

  Future<void> deleteUser(String id) async {
    await userService.deleteUser(id).whenComplete(() {
      log('delete user done');
      notifyListeners();
      refresh();
    }).catchError((err) {
      log('delete user error : $err');
    });
  }

  UserModel findUserByIdOffline(String id) {
    UserModel model = UserModel.empty();
    if (offlineUsers.users.isNotEmpty) {
      model = offlineUsers.users.singleWhere((element) => element.uid == id);
    }
    return model;
  }

  Future<UserModel> findProductByIdOnLine(String id) async {
    return await userService.getUser(id).catchError((err) {
      log('find product error : $err');
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
}
