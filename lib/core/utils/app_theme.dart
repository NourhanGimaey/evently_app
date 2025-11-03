import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData appLightTheme = ThemeData(
  primaryColor: AppColors.blue,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.lightTheme),
  scaffoldBackgroundColor: AppColors.lightTheme,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.blue,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
);

final ThemeData appDarkTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: AppColors.darkTheme),
  scaffoldBackgroundColor: AppColors.darkTheme,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.blue,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
  ),
);
