import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/action_button.dart';
import 'package:estacionamento_joao/app/core/widgets/park_line_item_list.dart';
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
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
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
              _parkingList()
            ],
          ),
        ),
      )),
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
          ),
          Container(
            height: 50,
            width: 1,
            color: KameleonColors.black_40,
          ),
          ActionButton(Icons.add, 'Nova\nEntrada'),
        ],
      );

  Widget _parkingList() => controller.parkingList[0].incomes?.isEmpty == true
      ? Container(
          margin: EdgeInsets.only(top: 32),
          child: Center(child: Text('Nenhum cliente por enquanto  :)')))
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Últimas entradas', style: KameleonTypography.bodyEmphasis),
            SizedBox(height: 8)
          ]
            ..addAll(controller.parkingList[0].incomes
                    ?.take(5)
                    .map((element) => ParkLineItemList(item: element))
                    .toList() ??
                [Container()])
            ..add(
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'TODAS ENTRADAS',
                    style: KameleonTypography.button,
                  ),
                ),
              ),
            ),
        );

  Widget _parkButton() =>
      ElevatedButton(onPressed: () {}, child: Text('Adicionar'));
}
