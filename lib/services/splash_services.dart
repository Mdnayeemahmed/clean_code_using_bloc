import 'dart:async';

import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.homeScreen, (route) => false));
  }
}