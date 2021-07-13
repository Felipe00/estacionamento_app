import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParkLineItemList extends StatelessWidget {
  final Incomes item;
  final String docID;
  final VoidCallback onClick;

  const ParkLineItemList(
      {required this.item, required this.docID, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      InkWell(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.leaveAt != null
                      ? KameleonColors.secondaryLight
                      : KameleonColors.primaryLight),
              child: Text(
                item.parkingSpace!,
                style: KameleonTypography.bodyEmphasis,
              ),
            ),
            Text(
              item.carPlate ?? "Não informado",
              style: KameleonTypography.bodyEmphasis,
            ),
            item.leaveAt != null
                ? Row(
                    children: [
                      Text(
                        DateFormat('HH:mm').format(DateTime.parse(
                            item.createdAt ?? DateTime.now().toString())),
                        style: KameleonTypography.bodyEmphasis,
                      ),
                      Text('/'),
                      Text(
                        DateFormat('HH:mm').format(DateTime.parse(
                            item.leaveAt ?? DateTime.now().toString())),
                        style: KameleonTypography.bodyEmphasis,
                      ),
                    ],
                  )
                : Text(
                    DateFormat('HH:mm').format(DateTime.parse(
                        item.createdAt ?? DateTime.now().toString())),
                    style: KameleonTypography.bodyEmphasis,
                  ),
            Icon(
                item.leaveAt != null ? Icons.check : Icons.keyboard_arrow_right)
          ],
        ),
      ),
      secondaryColor: item.leaveAt != null,
    );
  }
}
