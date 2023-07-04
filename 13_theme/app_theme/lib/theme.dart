import 'package:flutter/material.dart';

AppBarTheme _appBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: Colors.black54,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.deepOrange[100]),
    titleTextStyle: TextStyle(color: Colors.deepOrange[100], fontSize: 16),
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

ProgressIndicatorThemeData _progressIndicatorThemeData(ProgressIndicatorThemeData base){
  return base.copyWith(
    color: Colors.black54,
  );
}

DialogTheme _dialogTheme(DialogTheme base){
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: Colors.grey,

  );
}

ButtonStyle _buttonStyle(ButtonStyle base){
  return base.copyWith(
    backgroundColor: MaterialStatePropertyAll(Colors.deepOrange[100]),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    foregroundColor: const MaterialStatePropertyAll(Colors.black54),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(BottomNavigationBarThemeData base){
  return base.copyWith(
    backgroundColor: Colors.black54.withOpacity(0.6),
    elevation: 0,
    selectedItemColor: Colors.deepOrange[100],
    unselectedItemColor: Colors.black,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    labelLarge: const TextStyle(color: Colors.black54, fontSize: 16),
    bodyMedium: const TextStyle(color:  Colors.black54, fontSize: 16),
  );
}

ColorScheme _colorScheme(ColorScheme base) {
  return base.copyWith(
    background: Colors.white,
    primary: Colors.deepOrange[100],
    secondary: Colors.deepOrange[100],
    secondaryContainer: Colors.deepOrange[100],
    primaryContainer: Colors.deepOrange[100],
  );
}

ChipThemeData _chipThemeData(ChipThemeData base){
  return base.copyWith(
    backgroundColor: Colors.black54,
    disabledColor: Colors.grey,
    selectedColor: Colors.deepOrange[100],
    labelStyle: const TextStyle(color: Colors.white),
    showCheckmark: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    padding: const EdgeInsets.all(5),
    elevation: 0,
    side: const BorderSide(color: Colors.white, width: 6, style: BorderStyle.solid),


  );
}

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  //useMaterial3: true,

  appBarTheme: _appBarTheme(_themeLight.appBarTheme),

  textTheme: _textLight(_themeLight.textTheme),

  cardTheme: _cardTheme(_themeLight.cardTheme),

  progressIndicatorTheme: _progressIndicatorThemeData(_themeLight.progressIndicatorTheme),

  dialogTheme: _dialogTheme(_themeLight.dialogTheme),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buttonStyle(
      _themeLight.elevatedButtonTheme.style??const ButtonStyle(),
    ),
  ),

  bottomNavigationBarTheme: _bottomNavigationBarThemeData(_themeLight.bottomNavigationBarTheme),

  colorScheme: _colorScheme(_themeLight.colorScheme),

  chipTheme: _chipThemeData(_themeLight.chipTheme),

  primaryColorLight: Colors.deepOrange[100],
  primaryColorDark: Colors.deepOrange[100],
  scaffoldBackgroundColor: Colors.white,

  inputDecorationTheme: _inputDecorationTheme(_themeLight.inputDecorationTheme),

  iconTheme: _themeLight.iconTheme.copyWith(
    color: Colors.deepOrange[100],
  ),
);

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base){
  return base.copyWith(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
      color: Colors.deepOrange.shade100,
      width: 2,
    )),
    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(
      color: Colors.black54,
      width: 2,
    )),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelStyle: TextStyle(
      color: Colors.deepOrange[100],
    ),
    labelStyle: const TextStyle(
      color: Colors.black54,
    ),

    //suffixIconColor: Colors.black54,
    //focusColor: Colors.deepOrange[100],


  );
}
