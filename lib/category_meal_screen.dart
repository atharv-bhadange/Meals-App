import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        //leading: const Icon(Icons.line_weight),
      ),
      body: Center(
        child: Text(
          'New Screen!',
        ),
      ),
    );
  }
}
