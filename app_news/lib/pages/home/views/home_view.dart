
import 'package:flutter/material.dart';
import 'widgets/article_list.dart';
import 'widgets/header_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Header_Homepage(),
         Article_List(),
      ],
    ));
  }
}
