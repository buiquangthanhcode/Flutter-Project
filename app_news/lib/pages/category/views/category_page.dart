import 'package:app_news/pages/category/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoryCubit()..loadCategory(),
        child: const CategoryView(),
      ),
    );
  }
}
