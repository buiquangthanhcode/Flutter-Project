import 'package:app_news/models/articles.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum StateArticleType {
  loading,
  loaded,
  error,
}

class ArticleState extends Equatable {
  final StateArticleType status;
  final List<List<dynamic>> data;
  const ArticleState({
    this.status = StateArticleType.loading,
    this.data = const [],
  });

   

  @override
  List<Object> get props => [status];

  ArticleState copyWith({
    StateArticleType? status,
    List<List<dynamic>>? data,
  }) {
    return ArticleState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
