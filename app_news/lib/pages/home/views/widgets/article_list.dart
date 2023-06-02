import 'package:app_news/models/articles.dart';
import 'package:app_news/pages/article/cubit/article_cubit.dart';
import 'package:app_news/pages/article/cubit/article_state.dart';
import 'package:app_news/pages/category/cubit/category_cubit.dart';
import 'package:app_news/pages/category/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'card/title_category.dart';

class Article_List extends StatelessWidget {
  Article_List({
    super.key,
  });

  late var check = [];
  late List<String> name = [];
  late List<String> stringList = [];

  @override
  Widget build(BuildContext context) {
    print("Rebuild Article List");
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          check = context.read<CategoryCubit>().selectedChoose;
          stringList = check.map((number) => number.toString()).toList();
          check.forEach((element) {
            name.add(
                context.read<CategoryCubit>().getNameByIDCategory(element));
          });
          context.read<ArticleCubit>().getData(stringList);
          return BlocBuilder<ArticleCubit, ArticleState>(
              buildWhen: (previous, current) {
            return current.data != previous.data;
          }, builder: (context, state) {
            if (state.status == StateArticleType.loaded) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: check.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Title_Category(
                          name: name[index],
                          data: state.data[index] as List<Articles>);
                    },
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
