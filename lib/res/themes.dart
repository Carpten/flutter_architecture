import 'package:flutter/material.dart';
import 'package:flutter_architecture/res/clrs.dart';

class Themes {
  static final ThemeData appTheme = ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Clrs.backgroundColor);

  static final ThemeData norippleTheme =
      ThemeData(splashColor: Colors.transparent);
}
