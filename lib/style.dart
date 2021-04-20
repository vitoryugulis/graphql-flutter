import 'package:flutter/material.dart';

class Styles {
  static Color highLightTextColor = Color(0xff3B5CB8);
  static Color bodyTextColor = Color(0xff606377);
  static _Fonts fonts = new _Fonts();
  static _Texts texts = new _Texts();
}

class _Texts{

  TextStyle titleText = TextStyle(
      color: Styles.highLightTextColor,
      fontSize: 26,
      fontFamily: Styles.fonts.extraBold
  );

  TextStyle bodyText = TextStyle(
      color: Styles.bodyTextColor,
      fontSize: 18,
      fontFamily: Styles.fonts.medium
  );

  TextStyle highLightText = TextStyle(
      color: Styles.highLightTextColor,
      fontSize: 22,
      fontFamily: Styles.fonts.extraBold
  );
}

class _Fonts {
  String defaultFontFamily = "Metropolis Medium";
  String medium = "Metropolis Medium";
  String bold = "Metropolis Bold";
  String extraBold = "Metropolis Extra Bold";
  String extraBoldItalic = "Metropolis Extra Bold Italic";
  String boldItalic = "Metropolis Bold Italic";
}