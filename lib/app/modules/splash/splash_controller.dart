import 'package:estacionamento_joao/app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SplashController extends Disposable {
  RxDisposer? listener;

  SplashController() {
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );

    listener = _listenerFunction();
  }

  RxDisposer _listenerFunction() {
    return rxObserver(() {
      Future.delayed(Duration(seconds: 5))
          .then((value) => Modular.to.pushReplacementNamed('/home'));
          // iniciar o Firebase
    });
  }

  @override
  void dispose() {
    listener!();
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
  }
}
