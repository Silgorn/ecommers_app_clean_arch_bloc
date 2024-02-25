import 'package:ecommers_app2/presentation/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ecommers_app2/core/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoaded && state.cartItems.isNotEmpty) {
        int cartCounter = state.cartItems.length;
        return Stack(
          children: [
            const SizedBox(
              width: 35,
              height: 35,
              child: Icon(
                Iconsax.shopping_cart,
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "$cartCounter",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.textLight, fontSizeFactor: 0.8),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return const Icon(Iconsax.shopping_cart);
      }
    });
  }
}
