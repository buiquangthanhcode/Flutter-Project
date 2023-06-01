import 'package:app_news/models/articles.dart';
import 'package:app_news/pages/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  List<Articles> data = [];
  void getData() {
    emit(state.copyWith(status: StateHome.loading));
  }
} 
// bloc không return mà emit về state sử dụng build-when để cập nhật UI khi state thay đổi
