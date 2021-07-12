import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/widgets/park_line_item_list.dart';
import 'package:flutter/material.dart';

class ParkingList extends StatelessWidget {
  final bool firstItemsOnly;

  const ParkingList({this.firstItemsOnly = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firstItemsOnly
            ? ParkingLot.readRecentsItems()
            : ParkingLot.readItems(),
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
            items?.sort((a, b) => DateTime.parse(a.createdAt!)
                .compareTo(DateTime.parse(b.createdAt!)));
            return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var item = items![index];
                    String docID = snapshot.data!.docs[index].id;
                    return ParkLineItemList(item: item, docID: docID);
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

  List<Incomes>? _getItems(AsyncSnapshot<QuerySnapshot> snapshot) => snapshot.data?.docs
                .map((e) => Incomes.fromJson(e.data()['incomes']))
                .toList();
}
