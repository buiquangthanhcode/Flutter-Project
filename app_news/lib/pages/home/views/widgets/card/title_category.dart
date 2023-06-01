import 'package:app_news/models/articles.dart';
import 'package:flutter/material.dart';

import 'list_article_by_id.dart';

class Title_Category extends StatelessWidget {
  Title_Category({super.key, required this.name, required this.data});
  String name;
  List<Articles> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        name.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      List_Article_By_Id_Category(dataArticle: data)
    ]);
  }
}
