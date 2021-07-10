import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'parking_controller.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState
    extends ModularState<SuccessScreen, ParkingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              child: FlareActor(
                'assets/anim/success.flr',
                animation: 'play',
              ),
            ),
            Text('Cadastro realizado com sucesso!')
          ],
        ),
      ),
    );
  }
}
