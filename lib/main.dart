import 'package:flutter/material.dart';
import 'package:jjintok/constants/sizes.dart';
import 'package:jjintok/featurs/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const JJinTok());
}

class JJinTok extends StatelessWidget {
  const JJinTok({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JJinTok',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
