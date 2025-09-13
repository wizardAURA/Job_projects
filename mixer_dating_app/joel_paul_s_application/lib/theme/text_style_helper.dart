import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline26BoldSFPro => TextStyle(
        fontSize: 26.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF Pro',
      );

  TextStyle get headline24BoldOnest => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Onest',
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20ExtraBoldManrope => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w800,
        fontFamily: 'Manrope',
        color: appTheme.pink_900,
      );

  TextStyle get title16MediumManrope => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Manrope',
        color: appTheme.gray_600,
      );

  TextStyle get title16SemiBoldManrope => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Manrope',
        color: appTheme.white_A700,
      );

  TextStyle get title16MediumSFPro => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'SF Pro',
        color: appTheme.gray_900,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14MediumManrope => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Manrope',
      );

  TextStyle get body12SemiBoldManrope => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Manrope',
        color: appTheme.blue_gray_700,
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10LightManrope => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
        fontFamily: 'Manrope',
        color: appTheme.gray_600,
      );
}
