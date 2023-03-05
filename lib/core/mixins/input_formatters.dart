import 'package:flutter/services.dart';

mixin InputFormatter {
  TextInputFormatter get noSpaceFormatter => FilteringTextInputFormatter.deny(RegExp(r'\s'));

  String? formatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value.trim();
  }

  String? formatEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value.trim().toLowerCase();
  }
}
