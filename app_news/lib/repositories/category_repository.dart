import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/category.dart';
import 'package:http/http.dart' as http;

class CatgoryRepository {
  static const url =
      "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc";

  Future<dynamic> getCategories() async {
    final response = await http.get(Uri.parse(url));
    print(response);
    return response;
  }
}
