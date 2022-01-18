import 'package:flutter/material.dart';

// import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
// import 'screens/tabs_screen_top.dart';
import 'screens/tabs_screen_bottom.dart';
import 'screens/filters_screen.dart';
import 'models/meal.dart';
import 'dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetail.routeName: (ctx) => const MealDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilter),
      },
      // onGenerateRoute: //used as deafult route if mentioned route is not available
      // onUnknownRoute: , //last resort e.g. 404 page
    );
  }
}
