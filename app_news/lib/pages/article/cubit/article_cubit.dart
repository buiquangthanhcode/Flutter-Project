import 'package:app_news/pages/article/cubit/article_state.dart';
import 'package:app_news/services/article_services.dart';
import 'package:bloc/bloc.dart';

import '../../../models/articles.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(const ArticleState());
  ArticleService _articleService = ArticleService();
  List<Articles> data = [];
  List<List<Articles>> result = [];
  Future<void> getData(List<String> id) async {
    try {
      emit(state.copyWith(status: StateArticleType.loading));
      await Future.forEach(id, (element) async {
        List<Articles> data = await _articleService.getArticles(element);
        print(data[int.parse(element)].category.name);
        result.add(data);
      });
      emit(state.copyWith(status: StateArticleType.loaded));
    } catch (e) {
      emit(state.copyWith(status: StateArticleType.error));
    }
  }
}
