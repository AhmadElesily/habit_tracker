import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/home_page.dart';
import 'package:habit_tracker/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes:  {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
    ),
  );
}
