import 'dart:collection';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mr_bookshare/core/Models/user_model.dart';
import 'package:mr_bookshare/core/session_manager/session_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collection;
  final collectionName = 'users';

  User? _user;
  int statusCode = 0;
  String msg = '';

  UserService() {
    collection = _firestore.collection(collectionName);
  }

  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser!).uid;
  }

  Future<String> signIn(String email, String password) async {
    var msg = '';
    var uid = '';
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      uid = user!.uid;
      log('$user');
      // add all user data to SharedPerfs
      await addUserDataToPrefs(uid, false);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided for that user.';
      }else if (e.code == 'invalid-email') {
        msg = "This isn't an email";
      }
    }
    if (msg.isEmpty) {
      log('uid1 : $uid');
      return uid;
    }
    log('msg : $msg');
    return msg;
  }

  Future<void> addUserDataToPrefs(String uid, bool newUser,
      {UserModel? userModel}) async {
    if (newUser) {
      await Prefs.setStringValue('uid', userModel!.uid!);
      await Prefs.setStringValue('fullName', userModel.fullName!);
      await Prefs.setStringValue('email', userModel.email!);
      await Prefs.setStringValue('major', userModel.major!);
      await Prefs.setStringValue('imageUrl', userModel.imageUrl!);
      await Prefs.setBooleanValue('loginState', userModel.loginState!);
      await Prefs.setBooleanValue('state', userModel.state!);

    } else {
      UserModel model = await getUser(uid);
      await Prefs.setStringValue('uid', model.uid!);
      await Prefs.setStringValue('fullName', model.fullName!);
      await Prefs.setStringValue('email', model.email!);
      await Prefs.setStringValue('major', model.major!);
      await Prefs.setStringValue('imageUrl', model.imageUrl!);
      await Prefs.setBooleanValue('loginState', model.loginState!);
      await Prefs.setBooleanValue('state', model.state!);

    }
  }

  Future<void> logout() async {
    Prefs.setBooleanValue('loginState', false);
    await _firebaseAuth.signOut();
  }

  Future<String> signUp(HashMap userValues) async {
    var msg = '';
    try {
      var user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: userValues['email'], password: userValues['password']))
          .user;
      var model = UserModel(
        uid: user!.uid,
        fullName: userValues['fullName'],
        email: userValues['email'],
        password: userValues['password'],
        imageUrl: userValues['imageUrl'] ?? '',
        loginState: true,
        state: true,
        major: userValues['major'],

      );
      await addUser(model);
      msg = user.uid;
      // add all user data to SharedPerfs
      addUserDataToPrefs(msg, true, userModel: model);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        msg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        msg = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        msg = "This isn't an email";
      }
    } catch (e) {
      msg = '$e';
    }
    return msg;
  }

  Future<void> addUser(UserModel model) async {
    await collection.add(model.toJson()).catchError((error) {
      handleAuthErrors(error);
    });
  }

  Future<UserModel> getUser(String id) async {
    QuerySnapshot result = await collection.where('uid', isEqualTo: id).get();
    var data = result.docs[0];
    Map<String, dynamic> userMap = {};
    userMap['uid'] = data.get('uid');
    userMap['fullName'] = data.get('fullName');
    userMap['email'] = data.get('email');
    userMap['password'] = data.get('password');
    userMap['loginState'] = data.get('loginState');
    userMap['state'] = data.get('state');
    userMap['imageUrl'] = data.get('imageUrl');
    userMap['major'] = data.get('major');

    var userModel = UserModel.fromJson(userMap);
    return userModel;
  }

  Future<UserList> getUsers() async {
    QuerySnapshot result = await collection.get();
    List<UserModel> userDataList = [];
    Map<String, dynamic> userMap = {};
    for (var data in result.docs) {
      userMap['uid'] = data.get('uid');
      userMap['fullName'] = data.get('fullName');
      userMap['email'] = data.get('email');
      userMap['password'] = data.get('password');
      userMap['loginState'] = data.get('loginState');
      userMap['state'] = data.get('state');
      userMap['imageUrl'] = data.get('imageUrl');
      userMap['major'] = data.get('major');
      var userModel = UserModel.fromJson(userMap);
      userDataList.add(userModel);
    }
    return UserList(users: userDataList);
  }

  Future<UserModel> updateUser(String id, UserModel model) async {
    QuerySnapshot snapshot = await collection.where('uid', isEqualTo: id).get();
    var documentId = snapshot.docs[0];
    await collection
        .doc(documentId.id)
        .update(model.toJson()).whenComplete(() {
          Prefs.setBooleanValue('haveAnyChange', true);
    })
        .catchError((error) {
      handleAuthErrors(error);
    });
    return model;
  }

  Future<void> deleteUser(String id) async {
    await _firebaseAuth.currentUser!.delete().catchError((err) {
      handleAuthErrors(err);
      log(err);
      log(msg);
    });
    QuerySnapshot categoryData = await _firestore
        .collection(collectionName)
        .where('uid', isEqualTo: id)
        .get();
    String documentId = categoryData.docs[0].id;
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .delete()
        .whenComplete(() {
      Prefs.setBooleanValue('haveAnyChange', true);
    }).catchError((error) {
      handleAuthErrors(error);
      log(msg);
    });
  }

  Map<String, dynamic> getUserData() {
    var uid = Prefs.getStringValue('uid') ?? '';
    var fullName = Prefs.getStringValue('fullName') ?? '';
    var email = Prefs.getStringValue('email') ?? '';
    var major = Prefs.getStringValue('major') ?? '';
    var imageUrl = Prefs.getStringValue('imageUrl') ?? '';
    var loginState = Prefs.getBooleanValue('loginState') ?? '';
    var state = Prefs.getBooleanValue('state') ?? '';


    Map<String, dynamic> result = {};
    result['uid'] = uid;
    result['fullName'] = fullName;
    result['email'] = email;
    result['imageUrl'] = imageUrl;
    result['loginState'] = loginState;
    result['state'] = state;
    result['major'] = major;

    return result;
  }

  void handleAuthErrors(ArgumentError error) {
    String errorCode = error.message;
    switch (errorCode) {
      case "ABORTED":
        {
          statusCode = 400;
          msg = "The operation was aborted";
          log(msg);
        }
        break;
      case "ALREADY_EXISTS":
        {
          statusCode = 400;
          msg = "Some document that we attempted to create already exists.";
          log(msg);
        }
        break;
      case "CANCELLED":
        {
          statusCode = 400;
          msg = "The operation was cancelled";
          log(msg);
        }
        break;
      case "DATA_LOSS":
        {
          statusCode = 400;
          msg = "Unrecoverable data loss or corruption.";
          log(msg);
        }
        break;
      case "PERMISSION_DENIED":
        {
          statusCode = 400;
          msg =
              "The caller does not have permission to execute the specified operation.";
          log(msg);
        }
        break;
      default:
        {
          statusCode = 400;
          msg = error.message;
          log(msg);
        }
        break;
    }
  }
}
