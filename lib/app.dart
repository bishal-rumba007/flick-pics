import 'package:flutter/material.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/screens/home/home_page.dart';
import 'package:movie_app/screens/splash/splash_page.dart';
import 'package:movie_app/utils/theme.dart';


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      home: const DetailPage(),
      theme: darkTheme,
    );
  }
}