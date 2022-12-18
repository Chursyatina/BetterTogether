import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0x4F4D8C),
          secondary: Color(0xff6347),
          background: Color(0x64732F)),
          textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.red,
          selectionColor: Colors.black,
          selectionHandleColor: Colors.blue,
    ),);
}

extension ThemeDataExtension on ThemeData {
  Color get thirdPartyColor {
    return Color(0xff6347);
  }

  Color get foursPartyColor {
    return Color(0xff6347);
  }

  Color get fifthPartyColor {
    return Color(0xff6347);
  }
}
