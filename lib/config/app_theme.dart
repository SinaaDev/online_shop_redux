import 'package:flutter/material.dart';
import 'package:online_shop_redux/config/app_colors.dart';

class AppTheme{

  ThemeData themeData = ThemeData(
    fontFamily: 'DM SANS',
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0
    ),
    inputDecorationTheme: const InputDecorationTheme(
     focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: orange // Global border color
        ),),
  ));

}