import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor = TColors.accent,
    this.onTap,
  });

  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (dark ? TColors.darkPrimary : TColors.lightPrimary),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? TColors.lightPrimary : TColors.darkPrimary,
                ),
              ),
            ),

            /// Text
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
