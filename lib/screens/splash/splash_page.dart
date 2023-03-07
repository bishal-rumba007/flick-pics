import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),)));
  }

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
