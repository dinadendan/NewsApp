import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('FF101A21'),
  appBarTheme: AppBarTheme(
    titleSpacing: 15,
    color: HexColor('FF101A21'),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('FF101A21'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',

      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 100,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    selectedItemColor: Colors.white,
    unselectedItemColor: HexColor('FF607479'),
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('FF071924'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    overline: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    subtitle1 :TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.3,
      fontWeight: FontWeight.w500,

    ),


  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 15,
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Jannah',

        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 100,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
      color: HexColor('FF101A21'),
    ),
    selectedIconTheme: IconThemeData(
      color: HexColor('FF101A21')
    ),
    selectedItemColor: HexColor('FF101A21'),
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: HexColor('FF607479'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    overline: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    subtitle1 :TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.3,
      fontWeight: FontWeight.w500,

    ),
  ),
  fontFamily: 'Jannah',



);