
import 'package:mr_bookshare/core/Models/user_model.dart';
import 'package:mr_bookshare/core/session_manager/session_manager.dart';


UserModel getUserData() {
  var uid = Prefs.getStringValue('uid') ?? '';
  var fullName = Prefs.getStringValue('fullName') ?? '';
  var email = Prefs.getStringValue('email') ?? '';
  var imageUrl = Prefs.getStringValue('imageUrl') ?? '';
  var loginState = Prefs.getBooleanValue('loginState') ?? false;
  var state = Prefs.getBooleanValue('state') ?? false;
  var major = Prefs.getStringValue('major') ?? '';
  var password = Prefs.getStringValue('password') ?? '';

  Map<String, dynamic> result = {};
  result['uid'] = uid;
  result['fullName'] = fullName;
  result['email'] = email;
  result['imageUrl'] = imageUrl;
  result['loginState'] = loginState;
  result['state'] = state;
  result['major'] = major;
  result['password'] = password;

  var model = UserModel(
    uid: uid,
    major: major,
    email: email,
    password: password,
    fullName: fullName,
    imageUrl: imageUrl,
    loginState: loginState,
    state: state,
  );

  return model;
}
