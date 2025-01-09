import 'dart:convert';

import 'package:bloc_clean_coding/models/user/user_model.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {

  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal(){
  }

  factory SessionController(){
    return _session;
  }


  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue("userData", jsonEncode(user));
    localStorage.setValue("isLogin", "true");
  }

  Future<void> getUserFromPreference() async {
    try {
      // Read user data from storage
      String? userData = await localStorage.readValue("userData");
      String? isLogin = await localStorage.readValue("isLogin");

      if (userData != null) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true';
    } catch (e) {
      debugPrint("Error fetching user data: ${e.toString()}");
    }
  }

}