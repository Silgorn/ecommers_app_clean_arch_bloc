import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:ecommers_app2/presentation/bloc/category/category_cubit.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_event.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_sort_cubit/product_sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class PopupSortMenu extends StatelessWidget {
  const PopupSortMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSortCubit, String>(
      builder: (context, state) {
        return PopupMenuButton<String>(
          icon: const Icon(
            Iconsax.sort,
          ),
          onSelected: (String result) {
            switch (result) {
              case 'asc':
                bool isCategory = context.read<CategoryCubit>().isInCategory;
                String category = context.read<CategoryCubit>().categoryName;
                String sortBy = context.read<ProductSortCubit>().sortBy = 'asc';
                context
                    .read<ProductBloc>()
                    .add(GetProductsEvent(sortBy, category, isCategory));
                break;
              case 'desc':
                bool isCategory = context.read<CategoryCubit>().isInCategory;
                String category = context.read<CategoryCubit>().categoryName;
                String sortBy =
                    context.read<ProductSortCubit>().sortBy = 'desc';
                context
                    .read<ProductBloc>()
                    .add(GetProductsEvent(sortBy, category, isCategory));
                break;
            }
            context.read<ProductSortCubit>().selectMenuItem(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            CheckedPopupMenuItem<String>(
              value: 'asc',
              checked: state == 'asc',
              child: const Text(TTexts.menuItemAsc),
            ),
            CheckedPopupMenuItem<String>(
              value: 'desc',
              checked: state == 'desc',
              child: const Text(TTexts.menuItemDesc),
            ),
          ],
        );
      },
    );
  }
}
