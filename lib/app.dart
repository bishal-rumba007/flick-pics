import 'package:flutter/material.dart';
import 'package:movie_app/utils/theme.dart';

import 'main_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: darkTheme,
    );
  }
}
