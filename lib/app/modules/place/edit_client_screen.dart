import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/custom_text_field.dart';
import 'package:estacionamento_joao/app/modules/place/parking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class EditClientScreen extends StatefulWidget {
  final String docId;
  final Incomes item;

  EditClientScreen(this.docId, this.item);

  @override
  _EditClientScreenState createState() => _EditClientScreenState();
}

class _EditClientScreenState
    extends ModularState<EditClientScreen, ParkingController> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.carPlateController.text =
        widget.item.carPlate ?? 'Não informado';
    controller.parkingLotController.text =
        widget.item.parkingSpace ?? 'Não informado';
    controller.docId = widget.docId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Spacer(),
                _labelWidget(
                    'Veículo', widget.item.carPlate ?? "Não informado"),
                Spacer(),
                _labelWidget(
                    'Entrada em',
                    DateFormat('dd/MM/yyyy HH:mm')
                        .format(DateTime.parse(widget.item.createdAt!))),
                Spacer(),
                Text(
                  'Número da vaga? (Opcional)',
                  style: KameleonTypography.h1,
                ),
                CustomTextField(
                  controller: controller.parkingLotController,
                  inputType: TextInputType.number,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text('MARCAR SAÍDA'),
                          style: ElevatedButton.styleFrom(
                              primary: KameleonColors.secondary,
                              padding: EdgeInsets.all(16)),
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              controller.edit();
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                controller.edit();
                              }
                            },
                            child: Icon(Icons.check),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _labelWidget(label, value) => Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              value,
              style: KameleonTypography.hx,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
}
