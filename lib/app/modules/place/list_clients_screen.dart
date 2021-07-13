import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/parking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListClientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_left),
                    TextButton(
                      child: Text('INÍCIO',
                          style: KameleonTypography.body
                              .copyWith(color: KameleonColors.black)),
                      onPressed: () => Modular.to.pop(),
                    )
                  ],
                ),
                ParkingList(firstItemsOnly: false),
              ],
            )),
      ),
    );
  }
}
