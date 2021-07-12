import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'parking_controller.dart';

class NewClientScreen extends StatefulWidget {
  @override
  _NewClientScreenState createState() => _NewClientScreenState();
}

class _NewClientScreenState
    extends ModularState<NewClientScreen, ParkingController> {
  var formKey = GlobalKey<FormState>();
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
                Text(
                  'Qual a placa do veículo?',
                  style: KameleonTypography.h1,
                ),
                CustomTextField(
                  controller: controller.carPlateController,
                  maxlength: 7,
                  inputType: TextInputType.text,
                  validators: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (value.length < 7) {
                      return 'Necessário 7 dígitos: (BRA1234) ou (BRA1E23)';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Número da vaga? (Opcional)',
                  style: KameleonTypography.h1,
                ),
                CustomTextField(
                  controller: controller.parkingLotController,
                  inputType: TextInputType.number,
                  maxlength: 2,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          controller.save();
                        }
                      },
                      child: Icon(Icons.check),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
