import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.transparent,

  //Paleta de colores Dark Theme proyecto integraITV
  colorScheme: const ColorScheme.dark(
    background:  Color(0xFF1F2228),
    onBackground:  Color(0xFFFFFFFF),

    primary: Color(0xFF4B87FF),
    onPrimary: Color(0xFF000000),
    
  ),
    
    
    textTheme: const TextTheme(

    displayLarge: TextStyle( fontFamily: 'SFProText', fontSize: 57, fontWeight: FontWeight.bold, ),
    displayMedium: TextStyle( fontFamily: 'SFProText', fontSize: 45, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
    displaySmall: TextStyle( fontFamily: 'SFProText', fontSize: 36, fontStyle:FontStyle.italic, ),

    headlineLarge: TextStyle( fontFamily: 'SFProText', fontSize: 32, fontWeight: FontWeight.bold, ),
    headlineMedium: TextStyle( fontFamily: 'SFProText', fontSize: 28, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
    headlineSmall: TextStyle( fontFamily: 'SFProText', fontSize: 24, fontWeight:FontWeight.bold, ),
    
    titleLarge: TextStyle( fontFamily: 'SFProText', fontSize: 18, fontWeight: FontWeight.bold,),
    titleMedium: TextStyle( fontFamily: 'SFProText', fontSize: 18, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
    titleSmall: TextStyle( fontFamily: 'SFProText', fontSize: 14, fontStyle:FontStyle.italic, ),
    
    labelLarge: TextStyle( fontFamily: 'SFProText', fontSize: 14,  fontWeight: FontWeight.w500, ),
    labelMedium: TextStyle( fontFamily: 'SFProText', fontSize: 12, fontWeight: FontWeight.w500, ),
    labelSmall: TextStyle( fontFamily: 'SFProText', fontSize: 11, fontStyle:FontStyle.italic, fontWeight: FontWeight.w500,),
    
    bodyLarge: TextStyle( fontFamily: 'SFProText', fontSize: 14, fontStyle: FontStyle.normal, color: Color(0xFF787878) ),
    bodyMedium: TextStyle( fontFamily: 'SFProText', fontSize: 13, fontWeight:FontWeight.w800, color: Color(0xFF787878) ),
    bodySmall: TextStyle( fontFamily: 'SFProText', fontSize: 12, fontStyle:FontStyle.italic, ),
    
    
    

  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromARGB(255, 10, 10, 10),
  )
  
);