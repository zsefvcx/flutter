import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  useMaterial3: true,
  appBarTheme: _appBarTheme(_themeLight.appBarTheme),
  textTheme: _textLight(_themeLight.textTheme),
  cardTheme: _cardTheme(_themeLight.cardTheme),
  colorScheme: _colorScheme(_themeLight.colorScheme),
  progressIndicatorTheme: _progressIndicatorThemeData(_themeLight.progressIndicatorTheme),
  dialogTheme: _dialogTheme(_themeLight.dialogTheme),
  inputDecorationTheme: _inputDecorationTheme(_themeLight.inputDecorationTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buttonStyle(
        _themeLight.elevatedButtonTheme.style??const ButtonStyle(),
    ),
  ),
  bottomNavigationBarTheme: _bottomNavigationBarThemeData(_themeLight.bottomNavigationBarTheme),

  //bottomAppBarTheme: _bottomAppBarTheme(_themeLight.bottomAppBarTheme),


    // primaryColorDark: Colors.deepOrange[100],
    // primaryColorLight: Colors.deepOrange[100],

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

    //

    //primaryColor: Colors.deepOrange[100],

    // navigationBarTheme: NavigationBarThemeData(
    //   indicatorColor: Colors.deepOrange[100],
    // ),

    // bottomAppBarTheme: BottomAppBarTheme(
    //   color: Colors.black54,
    //   shadowColor: Colors.deepOrange[100],
    //
    // ),

    //primaryTextTheme: _textLight(_themeLight.textTheme),

    // navigationBarTheme: NavigationBarThemeData (
    //   shadowColor: Colors.black54,
    // ),


);

// BottomAppBarTheme _bottomAppBarTheme(BottomAppBarTheme base){
//   return base.copyWith(
//     color: Colors.black54,
//     shadowColor: Colors.black54,
//     shape: const CircularNotchedRectangle(),
//     elevation: 0,
//     padding: EdgeInsets.all(10),
//
//   );
// }

BottomNavigationBarThemeData _bottomNavigationBarThemeData(BottomNavigationBarThemeData base){
  return base.copyWith(
    backgroundColor: Colors.black54.withOpacity(0.6),
    elevation: 0,
  );
}

ButtonStyle _buttonStyle(ButtonStyle base){
  return base.copyWith(
    backgroundColor: MaterialStatePropertyAll(Colors.deepOrange[100]),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    foregroundColor: const MaterialStatePropertyAll(Colors.black54),
  );
}

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base){
  return base.copyWith(
    labelStyle: const TextStyle(
      color: Colors.black54,
    ),
    suffixIconColor: Colors.black54,

    border: const OutlineInputBorder(borderSide: BorderSide.none),

  );
}

DialogTheme _dialogTheme(DialogTheme base){
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: Colors.grey,

  );
}

ProgressIndicatorThemeData _progressIndicatorThemeData(ProgressIndicatorThemeData base){
  return base.copyWith(
    color: Colors.black54,
  );
}

ColorScheme _colorScheme(ColorScheme base) {
  return base.copyWith(
    primary: Colors.deepOrange[100],
    //secondary: Colors.black,
    primaryContainer: Colors.deepOrange[100],
    secondaryContainer: Colors.deepOrange[100],
    onSurface: Colors.black54,
    background: Colors.black54,
  );
}

CardTheme _cardTheme(CardTheme base) {
  return base.copyWith(
    color: Colors.deepOrange[100],
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    margin: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAliasWithSaveLayer);
}

AppBarTheme _appBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: Colors.black54,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.deepOrange[100]),
    titleTextStyle: TextStyle(color: Colors.deepOrange[100], fontSize: 16),
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    labelLarge: const TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: const TextStyle(color:  Colors.black54, fontSize: 16),
  );
}
