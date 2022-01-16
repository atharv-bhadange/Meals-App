import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  const CategoryMealScreen({Key? key}) : super(key: key);
  // CategoryMealScreen(
  //     {Key? key, required this.categoryTitle, required this.categoryId})
  //     : super(key: key);

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeAgrs = ModalRoute.of(context)?.settings.arguments
        as Map<String, String>; //accessing route associated with current widget

    final String categoryTitle = routeAgrs['title'].toString();
    final String categoryId = routeAgrs['id'].toString();

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          //leading: const Icon(Icons.line_weight),
        ),
        body: ListView.builder(
          itemBuilder: (context, idx) {
            return MealItem(
              affordability: categoryMeals[idx].affordability,
              complexity: categoryMeals[idx].complexity,
              duration: categoryMeals[idx].duration,
              imageUrl: categoryMeals[idx].imageUrl,
              title: categoryMeals[idx].title,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
