import 'package:flutter/material.dart';

abstract class AppTextStyle {
  // Font Family
  static const String fontFamily = 'Cairo'; // Make sure this is the name of your font family in pubspec.yaml

  // Headings
  static TextStyle heading1Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4, // 140% line height
    letterSpacing: 0,
    
  );

  static TextStyle heading1Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle heading2Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
    
  );

  static TextStyle heading2Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle heading3Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 33,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle heading3Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 33,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );

    static TextStyle heading4Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle heading4Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle heading5Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 23,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle font23Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 23,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );


  // Body Text Styles
  static TextStyle bodyLargeRegular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 19,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

    static TextStyle font19Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 19, // Corrected to 19px as per image. It was 15px by mistake.
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );
  static TextStyle font16SemiBold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );


  static TextStyle font16Regular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle font16Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle font13w400 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.6, // 160% line height
    letterSpacing: 0,
  );

  static TextStyle font13Bold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.7, // 170% line height
    letterSpacing: 0,
  );

    static TextStyle font13w600 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.7, // 170% line height
    letterSpacing: 0,
  );

  static TextStyle bodyXSmallRegular = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static TextStyle bodyXSmallBold = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: 0,
  );
  static TextStyle font11SemiBoldW600 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
}