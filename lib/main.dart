import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Color(0xffD9D9D9),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffD75D72)),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: SplashView(),
    );
  }
}
