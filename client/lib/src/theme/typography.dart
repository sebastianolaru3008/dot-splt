import 'package:flutter/material.dart';
import 'package:split/src/theme/colors.dart';

enum CustomTextStyle { primary, secondary, inactive }

class CustomTypography {
  //region Headings
  static TextStyle h1({CustomTextStyle? textStyle}) =>
      _styleFrom(h1Builder, textStyle: textStyle);

  static TextStyle h2({CustomTextStyle? textStyle}) =>
      _styleFrom(h2Builder, textStyle: textStyle);

  static TextStyle h3({CustomTextStyle? textStyle}) =>
      _styleFrom(h3Builder, textStyle: textStyle);

  static TextStyle h4({CustomTextStyle? textStyle}) =>
      _styleFrom(h4Builder, textStyle: textStyle);

  static TextStyle h5({CustomTextStyle? textStyle}) =>
      _styleFrom(h5Builder, textStyle: textStyle);

  static TextStyle h6({CustomTextStyle? textStyle}) =>
      _styleFrom(h6Builder, textStyle: textStyle);

  //endregion

  //region Subheadings
  static TextStyle sh1({CustomTextStyle? textStyle}) =>
      _styleFrom(sh1Builder, textStyle: textStyle);

  static TextStyle sh2({CustomTextStyle? textStyle}) =>
      _styleFrom(sh2Builder, textStyle: textStyle);

  static TextStyle sh3({CustomTextStyle? textStyle}) =>
      _styleFrom(sh3Builder, textStyle: textStyle);

  //endregion

  //region Paragraphs
  static TextStyle p1({CustomTextStyle? textStyle}) =>
      _styleFrom(p1Builder, textStyle: textStyle);

  static TextStyle p2({CustomTextStyle? textStyle}) =>
      _styleFrom(p2Builder, textStyle: textStyle);

  static TextStyle p3({CustomTextStyle? textStyle}) =>
      _styleFrom(p3Builder, textStyle: textStyle);

  //endregion

  //region Numeric
  static TextStyle n1({CustomTextStyle? textStyle}) =>
      _styleFrom(n1Builder, textStyle: textStyle);

  static TextStyle n2({CustomTextStyle? textStyle}) =>
      _styleFrom(n2Builder, textStyle: textStyle);

  static TextStyle n3({CustomTextStyle? textStyle}) =>
      _styleFrom(n3Builder, textStyle: textStyle);

  //endregion

  //region Button Text
  static TextStyle b1(Color color) => _buttonStyleFrom(b1Builder, color);

  static TextStyle b2(Color color) => _buttonStyleFrom(b2Builder, color);

  //endregion

  static Color inactiveColor =
      CustomColor.white(opacity: CustomOpacity.inactive);

  static Color primaryColor = CustomColor.white(opacity: CustomOpacity.primary);

  static Color secondaryColor =
      CustomColor.white(opacity: CustomOpacity.secondary);

  static TextStyle _styleFrom(TextStyleBuilder builder,
      {CustomTextStyle? textStyle = CustomTextStyle.primary}) {
    Color stateColor(CustomTextStyle textStyle) {
      switch (textStyle) {
        case CustomTextStyle.primary:
          return primaryColor;
        case CustomTextStyle.secondary:
          return secondaryColor;
        case CustomTextStyle.inactive:
          return inactiveColor;
      }
    }

    return (builder..color = stateColor(textStyle ?? CustomTextStyle.primary))
        .build();
  }

  static TextStyle _buttonStyleFrom(TextStyleBuilder builder, Color color) {
    return (builder..color = color).build();
  }

  @protected
  static TextStyleBuilder get h1Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 48;

  @protected
  static TextStyleBuilder get h2Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 40;

  @protected
  static TextStyleBuilder get h3Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 32;

  @protected
  static TextStyleBuilder get h4Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 28;

  @protected
  static TextStyleBuilder get h5Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 20;

  @protected
  static TextStyleBuilder get h6Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 18;

  @protected
  static TextStyleBuilder get sh1Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 16;

  @protected
  static TextStyleBuilder get sh2Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 14;

  @protected
  static TextStyleBuilder get sh3Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 12;

  @protected
  static TextStyleBuilder get p1Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.regular
    ..fontSize = 16;

  @protected
  static TextStyleBuilder get p2Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.regular
    ..fontSize = 14;

  @protected
  static TextStyleBuilder get p3Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.regular
    ..fontSize = 12;

  @protected
  static TextStyleBuilder get n1Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 40;

  @protected
  static TextStyleBuilder get n2Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 30;

  @protected
  static TextStyleBuilder get n3Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.regular
    ..fontSize = 12;

  @protected
  static TextStyleBuilder get b1Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 16;

  @protected
  static TextStyleBuilder get b2Builder => TextStyleBuilder()
    ..fontFamily = CustomFont.bold
    ..fontSize = 14;
}

class CustomFont {
  static const regular = "GrundfosTheSansV2Regular";
  static const semiLight = "GrundfosTheSansV2SemiLight";
  static const bold = "GrundfosTheSansV2Bold";
  static const extraBold = "GrundfosTheSansV2ExtraBold";
}

class TextStyleBuilder {
  String? fontFamily;
  double? fontSize;
  double? letterSpacing;
  Color? color;

  TextStyle build() => TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      color: color);
}
