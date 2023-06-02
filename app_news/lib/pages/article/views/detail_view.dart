import 'dart:math';

import 'package:app_news/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.dataArticles});
  final dataArticles;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    var stringHTML = '''
<!DOCTYPE html>
<html lang="vn">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style='"margin: 0; padding: 0;'>
{{content}}
</body>
</html>
''';

    print(stringHTML.replaceAll(
        '{{content}}', widget.dataArticles.content.toString()));
    controller = WebViewController()
      ..loadHtmlString(stringHTML.replaceAll(
          '{{content}}', widget.dataArticles.content.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.dataArticles.category.name,
                style: TextStyle(fontSize: 15, color: Colors.green.shade400),
              ),
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              Text(
                widget.dataArticles.category.name,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(widget.dataArticles.publish_date),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.dataArticles.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.dataArticles.description,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          )
        ],
      ),
    ));
  }
}
