
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData kameleonTheme({
  Color primaryColor: Colors.blue,
  Color secondaryColor: Colors.lightBlue,
  Color scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
        },
      ),
      errorColor: Color(0xFFF44336),
      primaryColor: primaryColor,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      highlightColor: Colors.white,
      primarySwatch: MaterialColor(primaryColor.value, {
        50: primaryColor.withOpacity(.1),
        100: primaryColor.withOpacity(.2),
        200: primaryColor.withOpacity(.3),
        300: primaryColor.withOpacity(.4),
        400: primaryColor.withOpacity(.5),
        500: primaryColor.withOpacity(.6),
        600: primaryColor.withOpacity(.7),
        700: primaryColor.withOpacity(.8),
        800: primaryColor.withOpacity(.9),
        900: primaryColor.withOpacity(1),
      }),
      colorScheme:
          ColorScheme.light(primary: primaryColor, secondary: secondaryColor),
      fontFamily: GoogleFonts.openSans().fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: primaryColor),
      ),
      primaryColorBrightness: Brightness.light,
      disabledColor: primaryColor.withOpacity(0.4),
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        textTheme: TextTheme(),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16),
        bodyText2: TextStyle(fontSize: 16),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        height: 48,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      tooltipTheme: TooltipThemeData(
          margin: EdgeInsets.only(top: 6),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color.fromRGBO(0, 0, 0, 0.88)),
          textStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.white,
          )));
}
