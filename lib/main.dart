import 'package:flutter/material.dart';

import 'package:meals_app/meals_app.dart';
import 'package:meals_app/meals/meals.dart';
import 'package:meals_app/cuisines/cuisines.dart';

void main() => runApp(MealsApp(
      mealsRepository: MealsRepository(),
      cuisinesRepository: CuisinesRepository(),
    ));
