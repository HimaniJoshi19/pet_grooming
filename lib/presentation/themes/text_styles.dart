import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/font_constants.dart';
import 'package:pet_grooming/presentation/widgets/components/spacings.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';

/// TextStyles
class TextStyles {
  static TextStyle titleAppBar({
    Color? color,
    FontWeight fontWeight = FontConstants.bold,
    double size = 20,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color ?? Palette.white,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
      );

  static TextStyle title({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.bold,
    double size = 20,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle titleMedium({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.medium,
    double size = Spacings.medium,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      );

  static TextStyle titleSmall({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.bold,
    double size = 13,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle tabBarSmall({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.bold,
    double size = 13,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      );

  static TextStyle normal({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.regular,
    double size = 15,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle normalDrawer({
    Color? color = Palette.white,
    FontWeight fontWeight = FontConstants.medium,
    double size = 18,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle normalMedium({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.medium,
    double size = 14,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle normalSmall({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.regular,
    double size = 12,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle button({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.bold,
    double size = 16,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle textStyleButtonSecondary({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.regular,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle textStyleButtonPrimary({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.regular,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle onBoardingLineStyle({
    Color? color = Palette.colorOnBoardingLine1,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: Spacings.custom36,
        fontWeight: FontConstants.medium,
        fontFamily: fontFamily,
      );

  /// Default BoxDecoration
  static BoxDecoration myFun(
    Color borderColor,
    Color pinBoxColor, {
    double borderWidth = 2.0,
    double radius = 5.0,
  }) {
    return BoxDecoration(
      border: Border.all(
        width: borderWidth,
      ),
      color: pinBoxColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }

  static TextStyle normalUnderline({
    Color? color = Palette.colorBlack,
    FontWeight fontWeight = FontConstants.regular,
    double size = 14,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        decoration: TextDecoration.underline,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      );
}
