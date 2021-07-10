import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/action_button.dart';
import 'package:estacionamento_joao/app/core/widgets/parking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(),
                    SizedBox(
                      height: 32,
                    ),
                    _btnActions(),
                    SizedBox(
                      height: 32,
                    ),
                    _titleParkingList(),
                    _parkingList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bem vindo,'),
          Text(
            'Seu João',
            style: KameleonTypography.h1,
          )
        ],
      );

  Widget _btnActions() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionButton(
            Icons.lock_clock,
            'Encerrar\nExpediente',
            colorPrimary: false,
            onTap: () {
              // TODO chamar a tela de encerrar expediente
            },
          ),
          Container(
            height: 50,
            width: 1,
            color: KameleonColors.black_40,
          ),
          ActionButton(
            Icons.add,
            'Adicionar\nEntrada',
            onTap: () => Modular.to.pushNamed('/parking'),
          ),
        ],
      );

  Widget _parkingList() => ParkingList();

  Widget _titleParkingList() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Entradas recentes', style: KameleonTypography.bodyEmphasis),
          TextButton(
            onPressed: () {},
            child: Text(
              'VER TUDO',
              style: KameleonTypography.button,
            ),
          )
        ],
      );
}
