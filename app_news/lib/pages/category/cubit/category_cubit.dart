import 'package:app_news/models/category.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/category_services.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryInitial());
  final CategoryService _categoryService = CategoryService();
  List<Category> data = [];
  List<int> selectedChoose = [];

  Future<void> listenCategorySelected(int id) async {
    if (selectedChoose.contains(id)) {
      selectedChoose.remove(id);
    } else {
      selectedChoose.add(id);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("selected", selectedChoose.toString());
  }

  void getSelectedID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("selected");
    if (value == 'null' || value == null || value == "[]") {
      selectedChoose = [1, 2, 3];
    } else {
      selectedChoose = value
          .toString()
          .replaceAll(RegExp(r'[\[\]\s]'), '')
          .split(',')
          .map((e) => int.parse(e))
          .toList();
    }
  }

  String getNameByIDCategory(int id) {
    Category category;
    category = data.firstWhere((category) => category.id == id);

    return category.name;
  }

  void loadCategory() async {
    try {
      emit(const CategoryLoading());
      data = (await _categoryService.getCategories());
      getSelectedID();
      emit(const CategoryLoaded());
    } catch (e) {
      emit(const CategoryError());
    }
  }
}
