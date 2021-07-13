import 'package:estacionamento_joao/app/modules/close_park/close_park_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CloseParkScreen extends StatefulWidget {
  @override
  _CloseParkScreenState createState() => _CloseParkScreenState();
}

class _CloseParkScreenState
    extends ModularState<CloseParkScreen, CloseParkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: InkWell(
            child: Text('Nada por aqui.. por enquanto\n\n\nToque para voltar'),
            onTap: () => Modular.to.pop(),
          ),
        ),
      ),
    );
  }
}
