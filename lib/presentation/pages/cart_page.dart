import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:ecommers_app2/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommers_app2/presentation/widgets/cart/cart_item.dart';
import 'package:ecommers_app2/presentation/widgets/common/error_mesaage.dart';
import 'package:ecommers_app2/presentation/widgets/common/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(TTexts.cartPageTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is CartEmpty) {
              return Center(
                child: Text(
                  TTexts.cartEmpty,
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
              );
            } else if (state is CartLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: TColors.accent,
              ));
            } else if (state is CartLoaded) {
              final cartItems = state.cartItems;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItem(
                      imageUrl: item.image,
                      title: item.title,
                      price: item.price,
                      quantity: item.quantity,
                      onTap: () {
                        context.read<CartBloc>().add(RemoveItemCart(item.id));
                        ScaffoldMessenger.of(context).showSnackBar(
                            showSnackBar(TTexts.snakBarRemoveProduct));
                      });
                },
              );
            } else if (state is CartError) {
              return showErrorText(state.message);
            }
            return const Center(child: Text(TTexts.unknownState));
          }),
        ));
  }
}
