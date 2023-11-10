import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/utils/text_style.dart';

class AppThemes {
  static const Color mainOrangeColor = Color(0xfffa6f55);
  static const Color mainTurquoiseColor = Color(0xff35C2C1);
  static const Color mainIndigoColor = Color(0xff15141f);
  static const Color mainWhiteColor = Color(0xfff4f9ff);
  static Color frostedWhite = const Color(0xffDADADA).withOpacity(.3);
  static Color frostedDark = const Color(0xff0F0F0F).withOpacity(.3);
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: mainIndigoColor,
    brightness: Brightness.dark,
    textTheme: appTextThemeLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainIndigoColor,
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: mainOrangeColor,
      unselectedItemColor: frostedWhite,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: mainOrangeColor,
      labelStyle: appTextThemeLight.headlineMedium,
      unselectedLabelColor: Colors.white,
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: mainOrangeColor, width: 3),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelStyle:
          appTextThemeLight.headlineMedium?.copyWith(fontSize: 16),
      splashFactory: InkRipple.splashFactory,
      dividerColor: Colors.transparent,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: mainOrangeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll<Color>(Colors.white),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: mainWhiteColor,
    brightness: Brightness.light,
    textTheme: appTextThemeDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainWhiteColor,
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: mainTurquoiseColor,
      unselectedItemColor: frostedDark,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: mainOrangeColor,
      labelStyle: appTextThemeDark.headlineMedium,
      unselectedLabelColor: Colors.white,
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: mainOrangeColor, width: 3),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelStyle:
          appTextThemeDark.headlineMedium?.copyWith(fontSize: 16),
      splashFactory: InkRipple.splashFactory,
      dividerColor: Colors.transparent,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: mainOrangeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll<Color>(Colors.black),
    ),
  );
}
