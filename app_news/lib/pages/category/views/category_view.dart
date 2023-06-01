import 'package:app_news/pages/category/cubit/category_cubit.dart';
import 'package:app_news/pages/category/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            final data = context.read<CategoryCubit>().data;
            final idC = context.read<CategoryCubit>().selectedChoose;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          "Reccomend for you",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                bool isSelected = idC.contains(data[index].id);
                                return StatefulBuilder(
                                  builder: (context, setStateChange) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Container(
                                              decoration: const BoxDecoration(
                                            color: Colors.amber,
                                          )),
                                          Center(
                                            child: Text(
                                              data[index].name.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            alignment: Alignment.bottomRight,
                                            child: Checkbox(
                                              shape: const CircleBorder(),
                                              tristate: true,
                                              activeColor: isSelected
                                                  ? const Color(0xff06bbfb)
                                                  : Colors.transparent,
                                              onChanged: (bool? value) {
                                                setStateChange(() {
                                                  isSelected = !isSelected;

                                                  context
                                                      .read<CategoryCubit>()
                                                      .listenCategorySelected(
                                                          data[index].id);
                                                });
                                              },
                                              value: isSelected,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              childCount: data.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 2 / 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            );
          } else {
            return const Center(
              child: Text("Category Page"),
            );
          }
        },
      ),
    );
  }
}
