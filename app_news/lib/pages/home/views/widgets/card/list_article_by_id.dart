import 'package:app_news/models/articles.dart';
import 'package:flutter/material.dart';

class List_Article_By_Id_Category extends StatelessWidget {
  List_Article_By_Id_Category({super.key, required this.dataArticle});
  List<Articles> dataArticle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: dataArticle.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(dataArticle[index].thumb),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataArticle[index].category.name),
                      Text(
                        dataArticle[index].title,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        dataArticle[index].description,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
