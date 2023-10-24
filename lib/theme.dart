import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData apptheme = bulidapptheme();
ThemeData bulidapptheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      onPrimary: onPrimary,
      primary: primary,
      onPrimaryContainer: onPrimaryContainer,
      primaryContainer: primaryContainer,
      background: background,
      onBackground: onBackground,
      onError: onError,
      error: error,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      onSurface: onSurface,
      surface: surface,
      secondary: secondary,
      onSecondary: secondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      onInverseSurface: onInverseSurface,
      shadow: shadow,
      inversePrimary: inversePrimary,
    ),
    textTheme: buildappTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
        //  selectionColor: kShrinePink100,
        ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(),
      ),
      floatingLabelStyle: TextStyle(color: primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: secondary, foregroundColor: onSecondary),
  );
}

TextTheme buildappTextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: base.headlineSmall!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 18.0,
    ),
    titleSmall: base.titleSmall!.copyWith(
      color: onPrimaryContainer,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    titleMedium: base.titleMedium!.copyWith(
      color: onSecondary,
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  );
}
