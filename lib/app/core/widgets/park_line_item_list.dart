import 'package:estacionamento_joao/app/core/models/park.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:estacionamento_joao/app/core/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParkLineItemList extends StatelessWidget {
  final Incomes item;

  const ParkLineItemList({required this.item});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      Row(
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
            style:
                KameleonTypography.bodyEmphasis,
          ),
          Text(
            DateFormat('HH:mm').format(
                DateTime.parse(item.createdAt ?? DateTime.now().toString())),
            style:
                KameleonTypography.bodyEmphasis,
          ),
          InkWell(
            onTap: () {
              // TODO chamar a tela para alterar um item
            },
            child: Icon(item.leaveAt != null ? Icons.check : Icons.keyboard_arrow_right),
          )
        ],
      ),
    );
  }
}
