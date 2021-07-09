import 'package:estacionamento_joao/app/modules/home/home_controller.dart';
import 'package:estacionamento_joao/app/modules/home/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomeScreen()),
  ];
}
