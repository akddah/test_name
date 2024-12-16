import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'extensions.dart';

class AppThemes {
  static const String _primaryColor = '#3C0A72';
  static const String _scaffoldBackgroundColor = '#ECE7F1';
  static const String _hoverColor = "#CAD0D8";
  static const Color _primaryLightColor = Colors.white;
  static const Color _primaryDarkColor = Colors.black;
  static const String _hintColor = "#76869A";
  static const String _disabledColor = "#626262";
  static const String _errorColor = "#FF445B";

  static ThemeData get lightTheme => ThemeData(
        primaryColor: _primaryColor.color,
        scaffoldBackgroundColor: _scaffoldBackgroundColor.color,
        textTheme: textLightTheme,
        hoverColor: _hoverColor.color,
        fontFamily: FontFamily.workSans,
        hintColor: _hintColor.color,
        primaryColorLight: _primaryLightColor,
        primaryColorDark: _primaryDarkColor,
        disabledColor: _disabledColor.color,
        canvasColor: _errorColor.color,
        dividerTheme: DividerThemeData(color: _hoverColor.color),
        appBarTheme: AppBarTheme(
          backgroundColor: _scaffoldBackgroundColor.color,
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: _primaryLightColor,
          iconTheme: const IconThemeData(color: _primaryDarkColor),
          titleTextStyle: const TextStyle(
            color: _primaryLightColor,
            fontSize: 24,
            fontFamily: FontFamily.workSans,
            fontWeight: FontWeight.w700,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: _primaryColor.color,
          error: _errorColor.color,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(fontSize: 14, color: _primaryDarkColor, fontWeight: FontWeight.w400),
          hintStyle: const TextStyle(fontSize: 12, color: _primaryDarkColor, fontWeight: FontWeight.w400),
          fillColor: _primaryLightColor,
          filled: true,
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: _errorColor.color), borderRadius: BorderRadius.circular(16.r)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: _disabledColor.color), borderRadius: BorderRadius.circular(16.r)),
          border: OutlineInputBorder(borderSide: BorderSide(color: _hoverColor.color), borderRadius: BorderRadius.circular(16.r)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor.color), borderRadius: BorderRadius.circular(16.r)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: _hoverColor.color), borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
        ),
      );

  static TextTheme get textLightTheme => const TextTheme(
        labelLarge: TextStyle(color: _primaryLightColor, fontSize: 14, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(color: _primaryLightColor, fontSize: 14, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(color: _primaryLightColor, fontSize: 14, fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(color: _primaryLightColor, fontSize: 14, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(color: _primaryLightColor, fontSize: 14, fontWeight: FontWeight.w300),
      );
}
