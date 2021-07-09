import 'dart:ui';

class KameleonColors {
  // ====================================================
  // Base colors
  // ====================================================
  static const primaryLight = const Color(0xFFFCAD4C);
  static const primary = const Color(0xFFF98718);
  static const primaryDark = const Color(0xFFC76D28);
  static final primary_04 = primary.withOpacity(.04);

  static const secondaryLight = const Color(0xFF9BADDE);
  static const secondary = const Color(0xFF5C67A2);
  static const secondaryDark = const Color(0xFF3C3852);

  // ====================================================
  // Alerts
  // ====================================================
  static const infoLight = const Color(0xFF009AEB);
  static const info = const Color(0xFF008AD2);
  static const infoDark = const Color(0xFF0079B8);

  static const successLight = const Color(0xFF40CF54);
  static const success = const Color(0xFF38B449);
  static const successDark = const Color(0xFF309C3F);
  static final success_04 = success.withOpacity(.04);

  static const warningLight = const Color(0xFFFFE064);
  static const warning = const Color(0xFFFFC73E);
  static const warningDark = const Color(0xFFE5B338);

  static const dangerLight = const Color(0xFFFF584C);
  static const danger = const Color(0xFFF44336);
  static const dangerDark = const Color(0xFFDB3C31);
  static final danger_04 = danger.withOpacity(.04);

  static const black = Color(0xFF000000);
  static final black_88 = black.withOpacity(.88);
  static final black_56 = black.withOpacity(.56);
  static final black_40 = black.withOpacity(.40);
  static final black_08 = black.withOpacity(.08);
}
