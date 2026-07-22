import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/categories/presentation/cubit/category_cubit.dart';
import 'package:sooqy/features/categories/presentation/cubit/category_states.dart';
import 'package:sooqy/features/categories/presentation/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<CategoryCubit>(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return LoadingIndicator();
          } else if (state is GetCategoriesError) {
             return ErrorIndicator(state.message);
          } else if (state is GetCategoriesSuccess) {
            return GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: customDelegate(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.categoryProducts,
                      arguments: state.categories[index].name,
                    );
                  },
                  child: CategoryCard(state.categories[index]),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount customDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    );
  }
}
