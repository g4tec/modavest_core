import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
  if (!Platform.environment.containsValue("FLUTTER_TEST")) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: Colors.grey,
      timeInSecForIosWeb: 5,
      fontSize: 18.0,
    );
  }
}
