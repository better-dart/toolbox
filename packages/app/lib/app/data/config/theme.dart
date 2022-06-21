import 'package:flutter/material.dart';

import 'color.dart';

enum AppTheme {
  yellowLight,
  yellowDark,
  redLight,
  redDark,
  greenLight,
  greenDark,
}

final appThemeData = {
  AppTheme.yellowLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryYellow,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryGrey,
    colorScheme: ColorScheme.light(
      primary: primaryYellow,
    ).copyWith(secondary: primaryYellow),
  ),
  AppTheme.yellowDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: secondaryYellow,
    scaffoldBackgroundColor: primaryGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryGrey,
    colorScheme: ColorScheme.dark(
      primary: secondaryYellow,
    ),
  ),
  AppTheme.redLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryDBlue,
    colorScheme: ColorScheme.light(
      primary: primaryRed,
    ),
  ),
  AppTheme.redDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: primaryDBlue,
    primaryColorDark: white2,
    primaryColorLight: secondaryDBlue,
    colorScheme: ColorScheme.dark(
      primary: primaryRed,
    ),
  ),
  AppTheme.greenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryBGrey,
    colorScheme: ColorScheme.light(
      primary: primaryGreen,
    ),
  ),
  AppTheme.greenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: primaryBGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryBGrey,
    colorScheme: ColorScheme.dark(
      primary: primaryGreen,
    ),
  ),
};
