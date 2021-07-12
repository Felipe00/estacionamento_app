import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ParkLineItemList extends StatelessWidget {
  final Incomes item;
  final String docID;

  const ParkLineItemList({required this.item, required this.docID});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      InkWell(
        onTap: () => Modular.to
            .pushNamed('/parking/edit', arguments: {'docId': docID, 'incomes': item}),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: KameleonColors.primaryLight),
              child: Text(
                item.parkingSpace!,
                style: KameleonTypography.bodyEmphasis,
              ),
            ),
            Text(
              item.carPlate ?? "Não informado",
              style: KameleonTypography.bodyEmphasis,
            ),
            Text(
              DateFormat('HH:mm').format(
                  DateTime.parse(item.createdAt ?? DateTime.now().toString())),
              style: KameleonTypography.bodyEmphasis,
            ),
            Icon(
                item.leaveAt != null ? Icons.check : Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
