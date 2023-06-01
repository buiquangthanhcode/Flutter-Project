import 'dart:convert';

import 'package:app_news/models/articles.dart';
import 'package:http/http.dart' as http;

class ArticleRepository {
  static const url =
      "http://apiforlearning.zendvn.com/api/categories_news/5/articles?offset=0&limit=10&sort_by=id&sort_dir=desc";

  Future<dynamic> getArticles() async {
    final response = await http.get(Uri.parse(url));
    print(response);
    return response;
  }
}
