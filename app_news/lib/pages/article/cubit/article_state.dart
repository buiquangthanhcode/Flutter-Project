import 'package:equatable/equatable.dart';

enum StateArticleType {
  loading,
  loaded,
  error,
}

class ArticleState extends Equatable {
  final StateArticleType status;
  const ArticleState({
    this.status = StateArticleType.loading,
  });

  @override
  List<Object> get props => [status];

  ArticleState copyWith({
    StateArticleType? status,
  }) {
    return ArticleState(
      status: status ?? this.status,
    );
  }
}
