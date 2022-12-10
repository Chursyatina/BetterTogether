import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xffBABDBF),
          secondary: Color(0xffF2F2F2),
          background: Color(0xffF2F2F2)),
          textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.red,
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
    ),);
}

extension ThemeDataExtension on ThemeData {
  Color get thirdPartyColor {
    return Color(0xff737373);
  }

  Color get foursPartyColor {
    return Color(0xff1C1B1F);
  }

  Color get fifthPartyColor {
    return Color(0xff000000);
  }
}
