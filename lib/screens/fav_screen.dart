import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favMeal;

  FavScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text("You have no Saved meals."),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}
