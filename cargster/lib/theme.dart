import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    fontFamily: "DINNext",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
      color: kTextColor,
      fontSize: 27,
    )),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    accentColor: kPrimaryColor,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kInputColor, width: 2.0),
    gapPadding: 0,
  );
  OutlineInputBorder outlineActiveInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    gapPadding: 0,
  );
  return InputDecorationTheme(
      // if we are define our floatingLabelBehavior in our theme then it's not applayed
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineActiveInputBorder,
      border: outlineInputBorder,
      hintStyle: TextStyle(
        color: kLightGreyColor,
        fontSize: 20,
        height: 1.0,
        textBaseline: null,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ));
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
