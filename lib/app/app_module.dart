import 'package:estacionamento_joao/app/modules/home/home_module.dart';
import 'package:estacionamento_joao/app/modules/place/parking_module.dart';
import 'package:estacionamento_joao/app/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/parking', module: ParkingModule()),
  ];
}
