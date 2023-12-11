import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'OpenSans',
    brightness: Brightness.light,
    useMaterial3: true,
    //scaffoldBackgroundColor: Colors.transparent,
    //Paleta de colores Light Theme proyecto integraITV
    colorScheme: const ColorScheme.light(
      shadow: Color.fromRGBO(103, 114, 148, 0.16),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0x00000000),
      outline: Color(0xFF4B87FF),
      primary: Color(0xFF4B87FF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFD5EC),
      onPrimaryContainer: Color(0xFF3C0021),
      secondary: Color(0XFFB5156D),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFFACFE7),
      onSecondaryContainer: Color(0xFF2C051A),
      tertiary: Color(0xFFB88112),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color.fromRGBO(14, 198, 127, 0.1),
      onTertiaryContainer: Color(0xFF2D1F04),
      error: Color(0xFFC62209),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFDD7D1),
      onErrorContainer: Color(0xFF340902),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 57,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 45,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal),
      displaySmall: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 36,
        fontStyle: FontStyle.italic,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 28,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal),
      headlineSmall: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 18,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal),
      titleSmall: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
      labelLarge: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 11,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontStyle: FontStyle.normal,
          color: Color(0xFF787878)),
      bodyMedium: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 13,
          fontWeight: FontWeight.w800,
          color: Color(0xFF787878)),
      bodySmall: TextStyle(
        fontFamily: 'SFProText',
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: const Color(0xFFffD0EA),
    ));
