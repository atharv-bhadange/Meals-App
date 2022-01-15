import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
        leading: const Icon(Icons.line_weight),
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 15,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                  title: catData.title, color: catData.color, id: catData.id),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
