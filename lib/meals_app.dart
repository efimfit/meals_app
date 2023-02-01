import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/cuisines/cuisines.dart';
import 'package:meals_app/filters/filters.dart';
import 'package:meals_app/meals/meals.dart';
import 'package:meals_app/tabs/tabs.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({
    super.key,
    required this.mealsRepository,
    required this.cuisinesRepository,
  });

  final MealsRepository mealsRepository;
  final CuisinesRepository cuisinesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MealsBloc(mealsRepository: mealsRepository)
              ..add(const MealsFetched())),
        BlocProvider(
            create: (context) =>
                CuisinesCubit(cuisinesRepository: cuisinesRepository)
                  ..fetchCuisines()),
      ],
      child: const MealsAppView(),
    );
  }
}

class MealsAppView extends StatelessWidget {
  const MealsAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals and Cuisines',
      theme: ThemeData(
          fontFamily: 'Raleway',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleMedium: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      initialRoute: TabsPage.routeName,
      routes: {
        TabsPage.routeName: (context) => const TabsPage(),
        CuisinePage.routeName: (context) => const CuisinePage(),
        MealDetails.routeName: (context) => const MealDetails(),
        Filters.routeName: (context) => const Filters(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const TabsPage());
      },
    );
  }
}
