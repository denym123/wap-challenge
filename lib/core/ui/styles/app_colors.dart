import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static AppColors? _instance;

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primaryColor => Colors.blue;
  Color get dividerColor => const Color(0xFFDDDDDE);
  Color get dividerColorDarkMode => const Color(0xFF414040);
  Color get errorColor => const Color(0xFFFF3B3B);
  Color get successColor => const Color(0xFF06C270);
  Color get warningColor => const Color(0xFFFFCC00);
  Color get infoColor => const Color(0xFF0063F7);
}
