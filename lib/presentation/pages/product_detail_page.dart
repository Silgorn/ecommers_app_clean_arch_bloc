import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:ecommers_app2/data/models/cart/cart_model.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommers_app2/presentation/widgets/common/snakbar.dart';
import 'package:ecommers_app2/presentation/widgets/product/product_cache_image.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? TColors.darkPrimary : TColors.lightPrimary,
      appBar: AppBar(title: const Text(TTexts.detailPageTittle)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: ProductCacheImage(
                  imageUrl: product.image,
                  width: TSizes.productImageSize,
                  height: TSizes.productItemHeight),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                RatingBarIndicator(
                  rating: product.rating.rate,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: TColors.ratingStar),
                  itemCount: 5,
                  itemSize: 15.0,
                  unratedColor: TColors.ratingStar.withAlpha(50),
                  // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                ),
                const SizedBox(width: TSizes.sm),
                Text('(${product.rating.rate})')
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: \$${product.price.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    CartModel cart = CartModel(
                      id: product.id,
                      title: product.title,
                      price: product.price,
                      image: product.image,
                    );

                    context.read<CartBloc>().add(AddItemCart(cart));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(showSnackBar(TTexts.snakBarAddProduct));
                  },
                  child: const Text(
                    TTexts.addToCartBtn,
                    style: TextStyle(color: TColors.textLight),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
