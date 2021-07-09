import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController extends Disposable {
  RxDisposer? listener;
  var parkingList = RxList<ParkingLot>();

  HomeController() {
    listener = _listenerFunction();
  }

  RxDisposer _listenerFunction() {
    return rxObserver(() {
      // inicialização
      parkingList.addAll(List.filled(
          1,
          ParkingLot(createdAt: DateTime.now().toString(), incomes: [
            // Incomes(
            //     carPlate: "HOV8595",
            //     createdAt: DateTime.now().toString(),
            //     parkingSpace: "40",
            //     leaveAt: null),
            //     Incomes(
            //     carPlate: "BRA3E33",
            //     createdAt: DateTime.now().toString(),
            //     parkingSpace: "41",
            //     leaveAt: null)
          ])));
    });
  }

  @override
  void dispose() {
    listener!();
  }
}
