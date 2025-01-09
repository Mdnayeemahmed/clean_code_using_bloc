import 'package:flutter/cupertino.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
class FlushBarHelper{
  static void flushBarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: msg,
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }

  static void flushBarSuccessMessage(String msg, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: msg,
        icon: Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }

}