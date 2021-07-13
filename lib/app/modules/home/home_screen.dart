import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/action_button.dart';
import 'package:estacionamento_joao/app/core/widgets/parking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  void initState() {
    controller.updateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget _appBar() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
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
              nextScreen('/close_park');
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
            onTap: () => nextScreen('/parking'),
          ),
        ],
      );

  Widget _parkingList() => RxBuilder(builder: (_) {
        print('>> ${controller.updateScreen}'); // Hack pra atualizar a lista
        controller.updateScreen.value = false;
        return ParkingList(firstItemsOnly: true);
      });

  Widget _titleParkingList() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Entradas recentes', style: KameleonTypography.bodyEmphasis),
          TextButton(
            onPressed: () => nextScreen('/parking/list_all'),
            child: Text(
              'VER TUDO',
              style: KameleonTypography.button,
            ),
          )
        ],
      );

  void nextScreen(String route, {arguments}) {
    Modular.to
        .pushNamed(route, arguments: arguments)
        .then((value) => controller.updateList());
  }
}
