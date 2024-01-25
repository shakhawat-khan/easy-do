import 'package:flutter/material.dart';

const inputDecorationTheme = InputDecorationTheme(
  constraints: BoxConstraints(
    maxHeight: 54,
  ),
  // labelStyle: TextStyle(color: Color(0xFFE9E9E9)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        14,
      ),
    ),
  ),
  // hintStyle: TextStyle(
  //   color: Color(0xFFE9E9E9),
  //   fontSize: 16,
  //   fontFamily: 'Manrope',
  //   fontWeight: FontWeight.w400,
  //   height: 0,
  // ),
);
