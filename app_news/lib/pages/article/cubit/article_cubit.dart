import 'package:app_news/pages/article/cubit/article_state.dart';
import 'package:app_news/services/article_services.dart';
import 'package:bloc/bloc.dart';

import '../../../models/articles.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(const ArticleState());
  final ArticleService _articleService = ArticleService();
  List<List<Articles>> result = [];
  Future<void> getData(List<String> id) async {
    try {
      emit(state.copyWith(status: StateArticleType.loading, data: []));
      await Future.forEach(id, (element) async {
        List<Articles> data = await _articleService.getArticles(element);
        result.add(data);
      });
      emit(state.copyWith(status: StateArticleType.loaded, data: result));
    } catch (e) {
      emit(state.copyWith(status: StateArticleType.error, data: []));
    }
  }

  @override
  void onChange(Change<ArticleState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
