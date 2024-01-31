import 'package:flutter/material.dart';

class AppStyle {
  
  static TextStyle styleLight({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleRegular({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
        fontSize: size, color: textColor, fontWeight: FontWeight.normal);
  }

  static TextStyle styleMedium({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleExtraBold({
    Color textColor = Colors.black,
    double size = 14,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w800,
    );
  }
}
