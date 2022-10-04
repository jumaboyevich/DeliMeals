import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  late List<Meal> favoritesList;

  FavoritesScreen(this.favoritesList);

  @override
  Widget build(BuildContext context) {
    if(favoritesList.isEmpty){
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }else{
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoritesList[index].id,
          title: favoritesList[index].title,
          imageUrl: favoritesList[index].imageUrl,
          duration: favoritesList[index].duration,
          complexity: favoritesList[index].complexity,
          affordability: favoritesList[index].affordability,

        );
      },
      itemCount: favoritesList.length,
    );
    }
  }
}
