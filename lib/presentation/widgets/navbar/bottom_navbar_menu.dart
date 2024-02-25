import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:ecommers_app2/presentation/bloc/navbar/bottom_navbar_cubit.dart';
import 'package:ecommers_app2/presentation/pages/cart_page.dart';
import 'package:ecommers_app2/presentation/pages/store_page.dart';
import 'package:ecommers_app2/presentation/pages/user_profile_page.dart';
import 'package:ecommers_app2/presentation/widgets/navbar/navbar_cart_counter_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavbarCubit, int>(
        builder: (context, state) {
          return NavigationBar(
              height: 60,
              elevation: 0,
              selectedIndex: state,
              onDestinationSelected: (index) {
                context.read<NavbarCubit>().controller.animateToPage(index,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear);
                context.read<NavbarCubit>().update(index);
              },
              backgroundColor:
                  darkMode ? TColors.darkPrimary : TColors.lightPrimary,
              // indicatorColor:
              //     darkMode ? TColors.lightBackground : TColors.darkBackground,
              indicatorColor: TColors.accent,
              destinations: navigationDestination);
        },
      ),
      body: Stack(
        children: [
          BlocBuilder<NavbarCubit, int>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: context.read<NavbarCubit>().controller,
                    children: bottomNavbarPages),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<NavigationDestination> navigationDestination = <NavigationDestination>[
  const NavigationDestination(
      icon: Icon(Iconsax.shop), label: TTexts.navBarLabelStore),
  const NavigationDestination(
      icon: CartCounterIcon(), label: TTexts.navBarLabelCart),
  const NavigationDestination(
      icon: Icon(Iconsax.user), label: TTexts.navBarLabelUser),
];

List<Widget> bottomNavbarPages = <Widget>[
  const StorePage(),
  const CartPage(),
  const UserProfilePage(),
];
