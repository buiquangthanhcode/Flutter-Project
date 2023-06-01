import 'dart:convert';
import 'package:app_news/models/articles.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<List<Articles>> getArticles(String categoryId) async {
    try {
      // print(categoryId);

      String url =
          "http://apiforlearning.zendvn.com/api/categories_news/${categoryId}/articles?offset=0&limit=10&sort_by=id&sort_dir=desc";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<Articles> result = [];
        var responseData = json.decode(response.body);
        List<Articles> data = List<Articles>.from(
            responseData.map((i) => Articles.fromJson(jsonEncode(i))));
        result = data;
        return result;
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      return Future<List<Articles>>.error(e.toString());
    }
  }
}
