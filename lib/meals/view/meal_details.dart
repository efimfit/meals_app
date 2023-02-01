import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/meals/bloc/meals_bloc.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  static const routeName = '/meal-details';

  Widget buildSection(String text, BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          '$text:',
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  bool _isFavourite(String mealId, BuildContext context) {
    return context
        .watch<MealsBloc>()
        .state
        .favouriteMeals
        .any((e) => e.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'] as String;
    final selectedMeal =
        context.read<MealsBloc>().state.meals.firstWhere((e) => e.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSection('Ingredients', context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                })),
            buildSection('Steps', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<MealsBloc>().add(FavouriteMealToogled(mealId: mealId)),
        child: Icon(
            _isFavourite(mealId, context) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
