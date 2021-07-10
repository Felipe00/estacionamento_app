import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app/core/styles/typography.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool colorPrimary;
  final Function onTap;

  const ActionButton(this.icon, this.title, {required this.onTap, this.colorPrimary = true});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => colorPrimary
              ? KameleonColors.primary.withAlpha(80)
              : KameleonColors.secondary.withAlpha(80))),
      onPressed: () => onTap.call(),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPrimary
                      ? KameleonColors.primaryLight
                      : KameleonColors.secondaryLight),
              child: Icon(
                icon,
                size: 36,
                color: colorPrimary
                    ? KameleonColors.primaryDark
                    : KameleonColors.secondaryDark,
              )),
          SizedBox(height: 16),
          Text(
            title,
            style: KameleonTypography.h2.copyWith(
                color: colorPrimary
                    ? KameleonColors.primary
                    : KameleonColors.secondary),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
