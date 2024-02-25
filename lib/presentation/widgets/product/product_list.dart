import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/router/app_router.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_state.dart';
import 'package:ecommers_app2/presentation/widgets/common/error_mesaage.dart';
import 'package:ecommers_app2/presentation/widgets/product/product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          List<ProductEntity> productsList = state.productsList;
          return Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                productsList.length,
                (index) {
                  return ProductCard(
                    imageUrl: productsList[index].image,
                    title: productsList[index].title,
                    price: productsList[index].price,
                    rating: productsList[index].rating.rate,
                    onTap: () => Navigator.of(context).pushNamed(
                        AppRouter.productDetails,
                        arguments: productsList[index]),
                  );
                },
              ),
            ),
          );
        } else if (state is ProductLoading) {
          return const SizedBox(
            height: 400,
            child: Center(
                child: CircularProgressIndicator(
              color: TColors.accent,
            )),
          );
        } else if (state is ProductError) {
          return SizedBox(height: 400, child: showErrorText(state.message));
        } else {
          return const Center(child: Text(TTexts.unknownState));
        }
      },
    );
  }
}
