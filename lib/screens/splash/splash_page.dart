import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Center(
        child: SizedBox(
          height: 190,
          width: 190,
          child: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
        ),
      ),
    );
  }
}
