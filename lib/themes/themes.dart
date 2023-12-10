import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme =ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness:Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme  (
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      color: Colors.white,

    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    selectedIconTheme:IconThemeData(
      color: Colors.white,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.white,


  ),
);

ThemeData thirdTheme =ThemeData(
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor:Colors.blueGrey[800],
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:Colors.blueGrey[800],
      statusBarIconBrightness:Brightness.dark,
    ),
    backgroundColor: Colors.blueGrey[800],
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.grey[350],
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey[350],
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[350],
  ),
  textTheme: TextTheme  (
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      color: Colors.grey[350],

    ),
    bodyText2: TextStyle(
      color: Colors.grey[350],
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blueGrey[800],
    unselectedItemColor: Colors.black54,
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.blue,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor:Colors.blue,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey[200],
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blue[700],
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.black,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
  ),
);