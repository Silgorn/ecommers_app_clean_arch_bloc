import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/image_strings.dart';
import 'package:ecommers_app2/domain/entities/category/category_entity.dart';
import 'package:ecommers_app2/presentation/bloc/category/category_cubit.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_event.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_sort_cubit/product_sort_cubit.dart';
import 'package:ecommers_app2/presentation/widgets/category/vertical_image_text.dart';

class HorizontalCategoryList extends StatelessWidget {
  final List<CategoryEntity> category;
  const HorizontalCategoryList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      height: 100,
      color: dark ? TColors.darkPrimary : TColors.lightPrimary,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalImageText(
                image: TImages.allProductsIcon,
                title: 'all products',
                onTap: () {
                  bool isCategory =
                      context.read<CategoryCubit>().isInCategory = false;
                  String sortBy = context.read<ProductSortCubit>().sortBy;
                  context
                      .read<ProductBloc>()
                      .add(GetProductsEvent(sortBy, '', isCategory));
                }),
            ListView.builder(
                shrinkWrap: true,
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final categoryName = category[index].name;
                  final imageFileName =
                      categoryImageMapping[categoryName] ?? TImages.defaultIcon;
                  return VerticalImageText(
                    image: imageFileName,
                    title: categoryName,
                    onTap: () {
                      bool isCategory =
                          context.read<CategoryCubit>().isInCategory = true;
                      context.read<CategoryCubit>().categoryName = categoryName;
                      String sortBy = context.read<ProductSortCubit>().sortBy;
                      context.read<ProductBloc>().add(
                          GetProductsEvent(sortBy, categoryName, isCategory));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Map<String, String> categoryImageMapping = {
  'electronics': TImages.electronicsIcon,
  'jewelery': TImages.jeweleryIcon,
  'men\'s clothing': TImages.menClothIcon,
  'women\'s clothing': TImages.womenClothIcon,
};
