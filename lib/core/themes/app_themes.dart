import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFonts.ibmPlex,
    textTheme: textTheme(color: AppColor.black),
  );

  static TextTheme textTheme({Color? color}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.sfPro,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.sfPro,
        color: color,
      ),
    );
  }
}
