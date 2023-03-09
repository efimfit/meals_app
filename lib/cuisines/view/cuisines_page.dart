import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/cuisines/cuisines.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: context
          .watch<CuisinesCubit>()
          .state
          .cuisines
          .map((e) => CuisineItem(id: e.id, title: e.title, color: e.color))
          .toList(),
    );
  }
}
