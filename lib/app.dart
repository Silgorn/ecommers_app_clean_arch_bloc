import 'package:ecommers_app2/core/router/app_router.dart';
import 'package:ecommers_app2/core/theme/theme.dart';
import 'package:ecommers_app2/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/category/category_cubit.dart';
import 'package:ecommers_app2/presentation/bloc/navbar/bottom_navbar_cubit.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_bloc.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_list_bloc/product_list_event.dart';
import 'package:ecommers_app2/presentation/bloc/product/product_sort_cubit/product_sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ProductBloc>()
            ..add(const GetProductsEvent('asc', '', false)),
        ),
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSortCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<CategoryCubit>()..loadCategories(),
        ),
        BlocProvider(
          create: (context) => di.sl<CartBloc>()..add(const GetItemsCart()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: "Online Shop",
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
      ),
    );
  }
}
