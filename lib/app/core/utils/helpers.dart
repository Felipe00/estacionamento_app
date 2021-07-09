import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFunctions {

  static void setStatusBarColor({
    required Color statusBarColor,
    required Brightness statusBarIconBrightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: statusBarIconBrightness,
    ));
  }
}