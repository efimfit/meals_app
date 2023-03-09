import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/meals/meals.dart';

class FavouriteMeals extends StatelessWidget {
  const FavouriteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state.favouriteMeals.isEmpty) {
          return Center(
            child: Text(
              'You have no favourites yet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: state.favouriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: state.favouriteMeals[index].id,
                title: state.favouriteMeals[index].title,
                imageUrl: state.favouriteMeals[index].imageUrl,
                duration: state.favouriteMeals[index].duration,
                complexity: state.favouriteMeals[index].complexity,
                affordability: state.favouriteMeals[index].affordability,
              );
            },
          );
        }
      },
    );
  }
}
