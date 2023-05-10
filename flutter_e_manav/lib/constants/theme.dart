import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.lightGreen),
      textStyle: TextStyle(fontSize: 17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: outlinedBorder,
    errorBorder: outlinedBorder,
    enabledBorder: outlinedBorder,
    focusedBorder: outlinedBorder,
    focusedErrorBorder: outlinedBorder,
    prefixIconColor: Colors.lightGreen,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

OutlineInputBorder outlinedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: 
  BorderSide(
    color: Colors.grey
    ),
);
