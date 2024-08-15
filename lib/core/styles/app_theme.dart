import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static const Color scaffoldBgColor = Color(0xFFDFECDB);
  static const Color greyColor = Color(0xFFC8C9CB);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: Colors.white)
    ),
        scaffoldBackgroundColor:  scaffoldBgColor,
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      elevation: 20,

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
//backgroundColor: Colors.red,
       shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4))
  //RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //     side: BorderSide(color: Colors.white, width: 4))

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      selectedIconTheme: IconThemeData(
        size: 30,
      )
    )
  );
}