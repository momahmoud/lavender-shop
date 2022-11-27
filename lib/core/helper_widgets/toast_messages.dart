import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla_shop/core/enums/enum_toast_states.dart';

class ToastMessages {
  static void showToastMessage({
    required String msg,
    required ToastStates state,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _chooseToastBgColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Color _chooseToastBgColor(ToastStates state) {
    Color? color;
    switch (state) {
      case ToastStates.SUCCESS:
        color = Colors.green;
        break;
      case ToastStates.ERROR:
        color = Colors.red;
        break;
      case ToastStates.WARNING:
        color = Colors.amber;
        break;
      default:
    }
    return color!;
  }
}
