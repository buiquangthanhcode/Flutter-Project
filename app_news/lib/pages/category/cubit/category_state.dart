import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}
class CategoryLoading extends CategoryState {
  const CategoryLoading();
}
class CategoryLoaded extends CategoryState {  
  const CategoryLoaded();
}
class CategoryError extends CategoryState {
  const CategoryError();
}
