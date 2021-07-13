import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController extends Disposable {
  var updateScreen = RxNotifier<bool>(false);

  HomeController();

  updateList() {
    updateScreen.value = true;
  }

  @override
  void dispose() {}
}
