import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:ecommers_app2/presentation/widgets/product/product_cache_image.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final VoidCallback onTap;
  const CartItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.quantity,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.sm),
          color: dark ? TColors.darkPrimary : TColors.lightPrimary,
        ),
        child: Row(
          children: [
            const SizedBox(width: TSizes.sm),
            Expanded(
              child: ProductCacheImage(
                imageUrl: imageUrl,
                width: TSizes.imageThumbSize,
                height: TSizes.imageThumbSize,
              ),
            ),
            const SizedBox(width: TSizes.sm),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: TSizes.sm),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                ],
              ),
            ),
            const SizedBox(width: TSizes.sm),
            Expanded(
              child: Text(
                '$quantity pcs',
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Iconsax.close_circle,
                color: TColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
