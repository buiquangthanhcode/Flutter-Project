import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/routes/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, AppRouterName.loginPage),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Image(
          image: AssetImage("assets/images/background_splash.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
