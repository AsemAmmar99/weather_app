import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: defaultAppColor,
        secondary: defaultAppColor,
      ),
      iconTheme: IconThemeData(color: defaultAppWhiteColor),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )));
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: defaultAppColor,
      secondary: defaultAppColor,
    ),
  );
}
