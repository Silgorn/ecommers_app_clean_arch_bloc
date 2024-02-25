import 'package:ecommers_app2/core/error/exception.dart';
import 'package:ecommers_app2/domain/entities/product/product_entity.dart';
import 'package:ecommers_app2/presentation/widgets/navbar/bottom_navbar_menu.dart';
import 'package:ecommers_app2/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String productDetails = 'product-details';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const BottomNavbar());
      case productDetails:
        ProductEntity product = routeSettings.arguments as ProductEntity;
        return MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product));
      default:
        throw const RouteException('Route not found!');
    }
  }
}
