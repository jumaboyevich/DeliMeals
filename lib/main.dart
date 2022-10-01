import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/category_meals_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.amberAccent),

          canvasColor: Color.fromRGBO(255, 254, 229, 1),
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
        '/':(ctx) => TabsScreen(),
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen()
      },
    );
  }
}

