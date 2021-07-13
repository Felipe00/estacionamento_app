import 'package:estacionamento_joao/app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CloseParkController extends Disposable {

  CloseParkController();

  @override
  void dispose() {
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
  }
}
