import 'package:flutter_modular/flutter_modular.dart';
import 'package:estacionamento_joao/app/core/styles/colors.dart';
import 'package:estacionamento_joao/app_custom_theme.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Estacionamento',
        theme: kameleonTheme(
          primaryColor: KameleonColors.primary,
          secondaryColor: KameleonColors.secondary,
        ),
      ).modular(),
    );
  }
}