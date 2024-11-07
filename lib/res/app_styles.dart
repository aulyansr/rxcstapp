import 'package:flutter/material.dart';

class AppStyles {
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color primaryColor = const Color(0xFF066937);
  static Color secondaryColor = const Color(0xFFEEF3F0);
  static Color mutedColor = const Color(0xFFD9D9D9);
  static Color mutedColor2 = const Color(0xFF808083);
  static Color blackPrimary = const Color(0xFF222320);

  static TextStyle onboardingTitle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor);

  static InputDecoration inputField = InputDecoration(
      filled: true,
      fillColor: Color(0xFFEEF3F0),
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(15),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 0, color: AppStyles.mutedColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 0, color: AppStyles.mutedColor)));
  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));

  static TextStyle textStyleTitle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppStyles.blackPrimary);

// cardPromo
  static TextStyle cardPromoType = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w300, color: AppStyles.primaryColor);

  static TextStyle cardPromoTitle = TextStyle(
      fontSize: 27, fontWeight: FontWeight.bold, color: AppStyles.primaryColor);

  static TextStyle cardPromoPeriod = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w300, color: AppStyles.mutedColor2);

  static TextStyle cardPromoTnc = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w300, color: AppStyles.primaryColor);
}
