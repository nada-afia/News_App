import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppThem {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(color: AppColors.white),
    cardColor: AppColors.black,
    indicatorColor: AppColors.black,
    canvasColor: AppColors.white,
    textTheme: TextTheme(
      labelLarge: AppStyles.blackBold16,
      labelMedium: AppStyles.blackMed14,
        labelSmall: AppStyles.blackMed24,
      displayLarge: AppStyles.whiteMed14
    ),
  );

  static ThemeData darkMode = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(color: AppColors.black),
    cardColor: AppColors.white,
    indicatorColor: AppColors.white,
    canvasColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      labelLarge: AppStyles.whiteBold16,
      labelMedium: AppStyles.whiteMed14,
        labelSmall: AppStyles.whiteMed24,
        displayLarge: AppStyles.blackMed14
    ),
  );
}