import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class Styles {
  Styles._();

  static TextStyle appbar({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 26,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bodyLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bodyMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration,
      letterSpacing: 1,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bodySmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle header({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 26,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle extraLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 46,
      fontFamily: fontFamily ?? Constants.appFont,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }
}
