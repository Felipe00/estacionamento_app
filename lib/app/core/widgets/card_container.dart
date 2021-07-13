import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget childz;
  final bool secondaryColor;
  const CardContainer(this.childz, {this.secondaryColor = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: secondaryColor
              ? KameleonColors.secondaryLight
              : KameleonColors.primary,
          shape: BoxShape.rectangle),
      child: childz,
    );
  }
}
