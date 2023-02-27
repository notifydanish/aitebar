import 'package:etibaar/core/extensions/app_theme_extension.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  MaterialColor get primarySwatch;

  MaterialColor createMaterialColor(Color color);

  Color get primary;

  Color get onPrimary;

  Color get secondary;

  Color get onSecondary;

  AppThemeExtension get extension;
}
