import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: _appBarTheme(_themeLight.appBarTheme),
  textTheme: _textLight(_themeLight.textTheme),
  cardColor: Colors.deepOrange[100],
  cardTheme: _cardTheme(_themeLight.cardTheme),

  //primaryColor: Colors.deepOrange[100],
  //scaffoldBackgroundColor: Colors.deepOrange[100],



  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     textStyle: TextStyle(
  //       color: Colors.black54,
  //       fontSize: 16,
  //
  //     ),
  // ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    ),
  )

);

CardTheme _cardTheme(CardTheme base){
  return base.copyWith(
    elevation: 10,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    ),
    margin: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAliasWithSaveLayer
  );
}

AppBarTheme _appBarTheme(AppBarTheme base){
  return base.copyWith(
    backgroundColor: Colors.black54,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.deepOrange[100]),
    titleTextStyle: TextStyle(color: Colors.deepOrange[100], fontSize: 16),
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    labelLarge: const TextStyle(
        color: Colors.black54,
        fontSize: 16
    ),

  );
}
