import 'package:flutter/material.dart';

// import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen_top.dart';
import '/screens/tabs_screen_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.orange,
          surface: Colors.amber,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 15,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: const TabsScreenBottom(),
      routes: {
//        '/': (ctx) => CategoriesScreen(), //default name '/' for first page
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        MealDetail.routeName: (ctx) => const MealDetail(),
      },
      // onGenerateRoute: //used as deafult route if mentioned route is not available
      // onUnknownRoute: , //last resort e.g. 404 page
    );
  }
}
