import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:ecommers_app2/presentation/widgets/product/product_cache_image.dart';
import 'package:flutter/material.dart';

import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final VoidCallback onTap;
  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: darkMode ? TColors.darkPrimary : TColors.lightPrimary,
          child: SizedBox(
            height: TSizes.productItemHeight,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      // child: Image.network(imageUrl, width: 50, height: 50),
                      child: ProductCacheImage(
                          imageUrl: imageUrl,
                          width: TSizes.imageThumbSize,
                          height: TSizes.imageThumbSize),
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$$price'),
                    const SizedBox(height: TSizes.sm),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: TColors.ratingStar),
                          itemCount: 5,
                          itemSize: 15.0,
                          unratedColor: TColors.ratingStar.withAlpha(50),
                          // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                        ),
                        const SizedBox(width: TSizes.sm),
                        Text(
                          '($rating)',
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
