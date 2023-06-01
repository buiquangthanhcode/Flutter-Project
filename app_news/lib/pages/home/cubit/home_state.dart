import 'package:equatable/equatable.dart';

enum StateHome {
  loading,
  loaded,
  error,
  getNews,
}

class HomeState extends Equatable {
  final StateHome status;
  const HomeState({
    this.status = StateHome.loading,
  });

  @override
  List<Object> get props => [status];

  HomeState copyWith({
    StateHome? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
