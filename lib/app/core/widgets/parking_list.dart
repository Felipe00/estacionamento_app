import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/widgets/park_line_item_list.dart';
import 'package:flutter/material.dart';

class ParkingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: ParkingLot.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ops, algo deu errado');
          } else if (snapshot.hasData || snapshot.data != null) {
            return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var item = Incomes.fromJson(
                        snapshot.data!.docs[index].data()['incomes']);
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
}
