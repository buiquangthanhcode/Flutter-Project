import 'package:app_news/pages/article/cubit/article_cubit.dart';
import 'package:app_news/pages/category/cubit/category_cubit.dart';
import 'package:app_news/pages/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ArticleCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit()..loadCategory(),
          ),
        ],
        child: const HomeView(),
      ),
    );
  }
}
