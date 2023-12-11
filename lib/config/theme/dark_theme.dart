import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'Noto Sans',
    brightness: Brightness.dark,
    useMaterial3: true,
    //scaffoldBackgroundColor: Colors.transparent,

    //Paleta de colores Dark Theme proyecto integraITV
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF16191D),
        onBackground: Color(0xFFFFFFFF),
        primary: Color(0xFF4B87FF),
        onPrimary: Color(0xFF000000),
        primaryContainer: Color(0xFF24282F)),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 10, 10, 10),
    ));
