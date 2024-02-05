// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor








import 'package:flutter/material.dart';
import '../../global_fields/fields.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: navyBlue,
    elevation: 0.0,
    toolbarHeight: tbh,
  ),
  brightness: Brightness.light,
  bottomAppBarTheme: BottomAppBarTheme(
    color: white..withOpacity(0.8),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white,
    elevation: 0.0,
    selectedIconTheme: const IconThemeData(
      color: navyBlue,
      size: 26.0,
    ),
    unselectedIconTheme: const IconThemeData(
      color: white,
      size: 26.0,
    ),
    selectedItemColor: navyBlue,
    unselectedItemColor: white,
    selectedLabelStyle: const TextTheme().labelLarge,
    unselectedLabelStyle: const TextTheme().labelLarge,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: navyBlue,
    hoverColor: navyBlue..withOpacity(0.6),
    disabledColor: grey..withOpacity(0.7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    textTheme: ButtonTextTheme.normal,
  ),
  cardColor: white,
  canvasColor: whiteSmoke,
  cardTheme: CardTheme(
    color: white,
    elevation: 0.0,
    shadowColor: white..withOpacity(0.4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15.0), side: const BorderSide(color: white, width: 5.0)),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(white),
    checkColor: MaterialStateProperty.all(navyBlue),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    side: const BorderSide(
      width: 0.5,
      color: white,
    ),
  ),
  dividerColor: navyBlueLighter,
  dividerTheme: const DividerThemeData(
    color: navyBlueLighter,
    space: 10.0,
    thickness: 10.0,
  ),
  dialogBackgroundColor: white,
  dialogTheme: DialogTheme(
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    titleTextStyle: const TextTheme().labelLarge,
    contentTextStyle: const TextTheme().bodyLarge,
    elevation: 10.0
  ),
  disabledColor: grey..withOpacity(0.7),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextTheme().bodyLarge,
      floatingLabelStyle: const TextTheme().labelLarge,
      helperStyle: const TextTheme().labelLarge,
      hintStyle: const TextTheme().bodyLarge, 
      errorStyle: const TextTheme().labelMedium?.copyWith(color: red),
      iconColor: white,
      prefixStyle: const TextTheme().labelMedium,
      prefixIconColor: white,
      suffixStyle: const TextTheme().labelMedium,
      suffixIconColor: navyBlue, 
      filled: false,
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide:  BorderSide(
          color: red,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide:  BorderSide(
          color: navyBlue,
          width: 1.0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide:  BorderSide(
          color: white,
          width: 1.0,
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(navyBlue),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
      elevation: MaterialStateProperty.all(0.5),
      side: MaterialStateProperty.all(const BorderSide(color: navyBlue, width: 0.5)),
      textStyle: MaterialStateProperty.all(const TextTheme().bodyLarge),
      animationDuration: const Duration(milliseconds: 60),
    ),
  ),
  focusColor: whiteSmoke,
  // floatingActionButtonTheme: FloatingActionButtonThemeData(), For mobile devices
  hoverColor: whiteSmoke,
  hintColor: white54,
  inputDecorationTheme: InputDecorationTheme(
    errorMaxLines: 3,
    labelStyle: const TextTheme().bodyLarge,
    floatingLabelStyle: const TextTheme().labelLarge,
    helperStyle: const TextTheme().labelLarge?.copyWith(color: white),
    hintStyle: const TextTheme().bodyLarge?.copyWith(color: white), 
    errorStyle: const TextTheme().labelMedium?.copyWith(color: red),
    iconColor: white,
    prefixStyle: const TextTheme().labelMedium,
    prefixIconColor: white,
    suffixStyle: const TextTheme().labelMedium,
    suffixIconColor: navyBlue, 
    filled: false,
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide:  BorderSide(
        color: red,
        width: 1.0,
      ),
    ), 
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide:  BorderSide(
        color: red,
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide:  BorderSide(
        color: white,
        width: 1.0,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide:  BorderSide(
        color: white,
        width: 1.0,
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: white,
    size: 10.0,
  ),
  listTileTheme: ListTileThemeData(
    tileColor: transparent,
    selectedColor: whiteSmoke,
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: navyBlue,
    linearTrackColor: transparent,
    circularTrackColor: transparent,
    refreshBackgroundColor: transparent,
  ),
  primaryColor: navyBlue,
  primaryColorLight: navyBlue,
  primaryColorDark: navyBlue,
  primaryIconTheme: const IconThemeData(
    color: white,
    size: 26.0,
  ),
  // platform: TargetPlatform.android, for mobile device
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(white),
      textStyle: MaterialStateProperty.all(const TextTheme().labelLarge),
      side: MaterialStateProperty.all(const BorderSide(color: navyBlue, width: 0.5)),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(navyBlue),
  ),
  scaffoldBackgroundColor: whiteSmoke,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(navyBlue),
    trackColor: MaterialStateProperty.all(grey),
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: navyBlue,
    inactiveTrackColor: whiteSmoke,
    trackShape: RectangularSliderTrackShape(),
    trackHeight: 4.0,
    thumbColor: navyBlue,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
    overlayColor: navyBlueLighter,
    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: white..withOpacity(0.8),
    actionTextColor: navyBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentTextStyle: const TextTheme().bodyLarge,
  ),
  tabBarTheme: TabBarTheme(
    indicator: const UnderlineTabIndicator(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
      borderSide: BorderSide(width: 5.0, color: navyBlue),
      insets: EdgeInsets.symmetric(horizontal: 16.0)
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: white,
    indicatorColor: navyBlue,
    overlayColor: MaterialStateProperty.all(transparent),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateColor.resolveWith((states) => transparent),
      backgroundColor: MaterialStateProperty.all(transparent),
      textStyle: MaterialStateProperty.all(const TextTheme().labelLarge?.copyWith(color: navyBlue)),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: white,
    selectionHandleColor: navyBlueLighter,
    selectionColor: navyBlueLighter,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: white),
    displayMedium: TextStyle(color: white),
    displaySmall: TextStyle(color: white),
    headlineLarge: TextStyle(color: white),
    headlineMedium: TextStyle(color: white),
    headlineSmall: TextStyle(color: white),
    titleLarge: TextStyle(color: white),
    titleMedium: TextStyle(color: white),
    titleSmall: TextStyle(color: white),
    bodyLarge: TextStyle(color: white),
    bodyMedium: TextStyle(color: white),
    bodySmall: TextStyle(color: white),
    labelLarge: TextStyle(color: white),
    labelMedium: TextStyle(color: white),
    labelSmall: TextStyle(color: white),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: true, 
    textStyle: const TextTheme().labelMedium, 
    decoration: BoxDecoration(
      color: navyBlueLighter,
      borderRadius: BorderRadius.circular(10.0)
    ),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), 
    excludeFromSemantics: false,
  )
);