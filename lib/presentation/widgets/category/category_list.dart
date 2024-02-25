import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommers_app2/domain/entities/category/category_entity.dart';
import 'package:ecommers_app2/presentation/bloc/category/category_cubit.dart';
import 'package:ecommers_app2/presentation/widgets/category/horizontal_category_list.dart';
import 'package:ecommers_app2/presentation/widgets/category/horizontal_skeleton_list.dart';
import 'package:ecommers_app2/presentation/widgets/common/error_mesaage.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      List<CategoryEntity> category = [];
      if (state is CategoryLoading) {
        return const HorizontalSkeletonList();
      } else if (state is CategoryLoaded) {
        category = state.categoryList;
      } else if (state is CategoryError) {
        return SizedBox(height: 100, child: showErrorText(state.message));
      }
      return HorizontalCategoryList(category: category);
    });
  }
}
