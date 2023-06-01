import 'package:app_news/app/routes/route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App News",
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
