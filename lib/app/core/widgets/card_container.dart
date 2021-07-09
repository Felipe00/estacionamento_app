import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget childz;
  const CardContainer(this.childz);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: KameleonColors.primary,
          shape: BoxShape.rectangle),
      child: childz,
    );
  }
}
