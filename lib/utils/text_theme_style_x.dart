import 'utils.dart';
import 'package:flutter/material.dart';

extension TextThemeStylesX on BuildContext {
  TextStyle get bodyText1 =>
      Theme.of(this).textTheme.bodyText1!.copyWith(color: ColorPalate.black1);

  TextStyle get bodyText2 =>
      Theme.of(this).textTheme.bodyText2!.copyWith(color: ColorPalate.black1);

  TextStyle get subtitle1 =>
      Theme.of(this).textTheme.subtitle1!.copyWith(color: ColorPalate.black1);

  TextStyle get subtitle2 =>
      Theme.of(this).textTheme.subtitle2!.copyWith(color: ColorPalate.black1);

  TextStyle get headline1 =>
      Theme.of(this).textTheme.headline1!.copyWith(color: ColorPalate.black1);

  TextStyle get headline2 =>
      Theme.of(this).textTheme.headline2!.copyWith(color: ColorPalate.black1);

  TextStyle get headline3 =>
      Theme.of(this).textTheme.headline3!.copyWith(color: ColorPalate.black1);

  TextStyle get headline4 =>
      Theme.of(this).textTheme.headline4!.copyWith(color: ColorPalate.black1);

  TextStyle get headline5 =>
      Theme.of(this).textTheme.headline5!.copyWith(color: ColorPalate.black1);

  TextStyle get headline6 =>
      Theme.of(this).textTheme.headline6!.copyWith(color: ColorPalate.black1);

  TextStyle get headlineLarge => Theme.of(this)
      .textTheme
      .headlineLarge!
      .copyWith(color: ColorPalate.black1);
  TextStyle get headlineMedium => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(color: ColorPalate.black1);
  TextStyle get headlineSmall => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(color: ColorPalate.black1);
  TextStyle get bodyLarge =>
      Theme.of(this).textTheme.bodyLarge!.copyWith(color: ColorPalate.black1);
  TextStyle get bodyMedium =>
      Theme.of(this).textTheme.bodyMedium!.copyWith(color: ColorPalate.black1);
  TextStyle get bodySmall =>
      Theme.of(this).textTheme.bodySmall!.copyWith(color: ColorPalate.black1);
  TextStyle get caption => Theme.of(this).textTheme.caption!.copyWith();
  TextStyle get displayLarge => Theme.of(this)
      .textTheme
      .displayLarge!
      .copyWith(color: ColorPalate.black1);
  TextStyle get displayMedium => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(color: ColorPalate.black1);
  TextStyle get displaySmall => Theme.of(this)
      .textTheme
      .displaySmall!
      .copyWith(color: ColorPalate.black1);
  TextStyle get labelLarge =>
      Theme.of(this).textTheme.labelLarge!.copyWith(color: ColorPalate.black1);
  TextStyle get labelLMedium =>
      Theme.of(this).textTheme.labelMedium!.copyWith(color: ColorPalate.black1);
  TextStyle get labelLSmall =>
      Theme.of(this).textTheme.labelSmall!.copyWith(color: ColorPalate.black1);
  TextStyle get titleLarge =>
      Theme.of(this).textTheme.titleLarge!.copyWith(color: ColorPalate.black1);
  TextStyle get titleMedium =>
      Theme.of(this).textTheme.titleMedium!.copyWith(color: ColorPalate.black1);
  TextStyle get titleSmall =>
      Theme.of(this).textTheme.titleSmall!.copyWith(color: ColorPalate.black1);

  ColorScheme get color => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
}
