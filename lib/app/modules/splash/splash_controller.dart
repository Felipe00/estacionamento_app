import 'package:estacionamento_joao/app/core/utils/helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController extends Disposable {

  SplashController() {
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );
    Future.delayed(Duration(seconds: 3)).then((value) => _initializeFirebase()
        .then((value) => Modular.to.pushReplacementNamed('/home')));
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  void dispose() {
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
  }
}
