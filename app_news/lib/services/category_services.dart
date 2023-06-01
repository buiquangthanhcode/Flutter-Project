import 'dart:convert';

import 'package:app_news/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static const url =
      "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc";
  Future<List<Category>> getCategories() async {
    try {
      //  final CatgoryRepository catgoryRepository = CatgoryRepository();
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Category> result = [];
        var responseData = json.decode(response.body);
        List<Category> data = List<Category>.from(
            responseData.map((i) => Category.fromJson(jsonEncode(i))));
        result = data;
       
        return result;
      } else {
        throw Exception('Failed to load category');
      }
    } catch (e) {
      return  Future<List<Category>>.error(e.toString());
    }
  }
}
