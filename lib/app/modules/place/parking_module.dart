import 'package:estacionamento_joao/app/modules/place/edit_client_screen.dart';
import 'package:estacionamento_joao/app/modules/place/list_clients_screen.dart';
import 'package:estacionamento_joao/app/modules/place/new_client_screen.dart';
import 'package:estacionamento_joao/app/modules/place/parking_controller.dart';
import 'package:estacionamento_joao/app/modules/place/success_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ParkingModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => ParkingController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/new_client', child: (_, __) => NewClientScreen()),
    ChildRoute('/edit', child: (_, args) => EditClientScreen(args.data['docId'], args.data['incomes'])),
    ChildRoute('/list_all', child: (_, __) => ListClientsScreen()),
    ChildRoute('/success', child: (_, __) => SuccessScreen()),
  ];
}
