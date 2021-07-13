import 'package:estacionamento_joao/app/modules/close_park/close_park_controller.dart';
import 'package:estacionamento_joao/app/modules/close_park/close_park_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CloseParkModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => CloseParkController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/close', child: (_, __) => CloseParkScreen()),
  ];
}
