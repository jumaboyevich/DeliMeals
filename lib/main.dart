import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/category_meals_screen.dart';
import 'package:deli_meals/screens/filters_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';

import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals=DUMMY_MEALS.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }

        return true;
        //...
      }).toList();
    });

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.amberAccent),

        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //     bodyText1: const TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     bodyText2: const TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     titleMedium: const TextStyle(
        //       fontSize: 24,
        //       fontFamily: 'RobotoCondensed',
        //     )
        // )
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
