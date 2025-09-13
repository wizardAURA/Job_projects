import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get gray_900 => Color(0xFF22242B);
  Color get gray_400 => Color(0xFFB3B4B7);
  Color get gray_900_01 => Color(0xFF5B3600);
  Color get gray_600 => Color(0xFF6E6F73);
  Color get orange_50 => Color(0xFFFFF3E3);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get pink_900 => Color(0xFF5E1053);
  Color get gray_800 => Color(0xFF44464B);
  Color get blue_gray_100_4f => Color(0x4FD5D5D5);
  Color get lime_900 => Color(0xFFA16000);
  Color get orange_100 => Color(0xFFFFE4BE);
  Color get gray_50 => Color(0xFFFDF9F5);
  Color get orange_800 => Color(0xFFBA6F00);
  Color get blue_gray_700 => Color(0xFF505254);
  Color get gray_50_01 => Color(0xFFFDFAF6);
  Color get lime_900_01 => Color(0xFFA96E18);
  Color get yellow_800 => Color(0xFFD59331);
  Color get pink_200_59 => Color(0x59FF97D1);
  Color get pink_800_4f => Color(0x4FB30142);
  Color get white_A700_01 => Color(0xFFFFFCFD);
  Color get gray_200 => Color(0xFFEEEEEE);
  Color get pink_100 => Color(0xFFEAB8CB);
  Color get red_A700 => Color(0xFFE40003);
  Color get pink_900_01 => Color(0xFF870078);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFF59FF => Color(0xFF59FF97);
  Color get color00FFFF => Color(0x00FFFFFF);
  Color get colorFF4FB3 => Color(0xFF4FB301);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
