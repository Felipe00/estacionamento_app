import 'package:estacionamento_joao/app/modules/splash/splash_controller.dart';
import 'package:estacionamento_joao/app/modules/splash/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreen()),
  ];
}
