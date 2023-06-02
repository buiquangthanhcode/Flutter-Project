import 'package:app_news/pages/article/views/detail_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DetailView(
        dataArticles: data,),
    );
  }
}
