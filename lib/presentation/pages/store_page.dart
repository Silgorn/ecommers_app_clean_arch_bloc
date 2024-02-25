import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:ecommers_app2/presentation/widgets/appbar/popup_sort_menu.dart';
import 'package:ecommers_app2/presentation/widgets/category/category_list.dart';
import 'package:ecommers_app2/presentation/widgets/product/product_list.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.appTitle),
        actions: const [PopupSortMenu()],
      ),
      body: const Column(
        children: [
          CategoryList(),
          SizedBox(height: 6.0),
          ProductsList(),
        ],
      ),
    );
  }
}
