import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ParkingController extends Disposable {
  var carPlateController = TextEditingController();
  var parkingLotController = TextEditingController();
  var income = RxNotifier<Incomes?>(null);

  String docId = '';

  ParkingController() {
    income.value = Incomes();
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );
  }

  void save() {
    income.value?.carPlate = carPlateController.text;
    income.value?.parkingSpace = parkingLotController.text;
    income.value?.createdAt = DateTime.now().toString();
    Modular.to.pushReplacementNamed('success');
    _returnToHome();
  }

  void edit() {
    income.value?.carPlate = carPlateController.text;
    income.value?.parkingSpace = parkingLotController.text;
    income.value?.createdAt = DateTime.now().toString();
    Modular.to.pushReplacementNamed('success');
    _returnToHome(isEditing: true);
  }

  void _returnToHome({isEditing = false}) =>
      Future.delayed(Duration(seconds: 3)).then((value) {
        if (isEditing) {
          ParkingLot.updateItem(incomes: income.value!, docId: docId);
        } else {
          ParkingLot.addItem(incomes: income.value!);
        }
        Modular.to.pop();
      });

  @override
  void dispose() {
    AppFunctions.setStatusBarColor(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
  }
}
