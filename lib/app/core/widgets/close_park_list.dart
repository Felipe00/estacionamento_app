import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/widgets/park_line_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CloseParkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: ParkingLot.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ops, algo deu errado');
          } else if (snapshot.hasData || snapshot.data != null) {
            if (snapshot.data?.size == 0) {
              return Expanded(
                child: Center(child: Text('Aguardando novos clientes')),
              );
            }
            List<Incomes>? items = _getItems(snapshot);
            items?.sort((a, b) => DateTime.parse(b.createdAt!)
                .compareTo(DateTime.parse(a.createdAt!)));
            return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: items?.length ?? 0,
                  itemBuilder: (context, index) {
                    var item = items![index];
                    return ParkLineItemList(
                      item: item,
                      docID: item.docId!,
                      onClick: () {
                        Modular.to.pushNamed('/parking/edit',
                            arguments: {'docId': item.docId!, 'incomes': item});
                      },
                    );
                  }),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                KameleonColors.secondaryDark,
              ),
            ),
          );
        });
  }

  List<Incomes>? _getItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map((e) {
          return Incomes.fromJsonDocId(e.data()['incomes'], e.id);
        })
        .toList();
  }
}
