import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.gray));
  static var darkBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.white));
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.gray),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.purple),
              ),
              backgroundColor: AppColors.purple,
              padding: EdgeInsets.symmetric(vertical: 16))),
      textTheme: TextTheme(
          labelMedium: TextStyle(
            color: AppColors.purple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.purple),
          titleSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.white)),
      dividerTheme: DividerThemeData(
        color: AppColors.purple,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.dartPurple,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dartPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: darkBorder,
        enabledBorder: darkBorder,
        focusedBorder: darkBorder,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.purple),
      ))),
      textTheme: TextTheme(
          labelMedium: TextStyle(
            color: AppColors.purple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.purple),
          titleSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.white)));
}
