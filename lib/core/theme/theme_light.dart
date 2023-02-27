import 'package:etibaar/core/extensions/app_theme_extension.dart';
import 'package:etibaar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeLight extends AppTheme {
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        primarySwatch: primarySwatch,
        extensions: [extension],
        colorScheme: ColorScheme.light(
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
        ),
      );

  @override
  MaterialColor get primarySwatch => createMaterialColor(primary);

  @override
  Color get primary => const Color(0xFF179E7C);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFF71C458);

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  @override
  AppThemeExtension get extension => AppThemeExtension(
        extraLightGrey: Colors.grey.withOpacity(0.3),
        lightGrey: Colors.grey.withOpacity(0.7),
        vertical: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primary, secondary],
        ),
        horizontal: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [primary, secondary],
        ),
      );

  @override
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds.abs()).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds.abs()).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds.abs()).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
