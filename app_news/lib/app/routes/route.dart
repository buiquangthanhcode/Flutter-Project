import 'package:app_news/app/routes/route_name.dart';
import 'package:app_news/pages/article/views/detail_page.dart';
import 'package:app_news/pages/home/views/home_page.dart';
import 'package:app_news/pages/login/views/login_page.dart';
import 'package:app_news/pages/navigation/navigation_bottom.dart';
import 'package:flutter/material.dart';

import '../../pages/splash/views/splash_page.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRouterName.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRouterName.navigationBottom:
        return MaterialPageRoute(builder: (_) => const NavigationBottom());
      case AppRouterName.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRouterName.detailPage:
        return MaterialPageRoute(builder: (_) =>  DetailPage(data: args,));
      case AppRouterName.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        _errPage();
    }
    return _errPage();
  }

  static Route _errPage() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No Router'),
        ),
      );
    });
  }
}
