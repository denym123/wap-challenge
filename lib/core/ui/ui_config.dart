import 'package:flutter/material.dart';

import '../core.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Portali App';

  static ThemeData get theme => ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    textTheme: AppTextTheme.i.textTheme,
    primaryColor: AppColors.i.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primaryColor,
      primary: AppColors.i.primaryColor,
      error: AppColors.i.errorColor,
    ),
  );
}
