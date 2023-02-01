import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/filters/view/main_drawer.dart';
import 'package:meals_app/meals/bloc/meals_bloc.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    final currentFilters = context.read<MealsBloc>().state.filters;
    _glutenFree = currentFilters['gluten'] ?? false;
    _lactoseFree = currentFilters['lactose'] ?? false;
    _vegetarian = currentFilters['vegetarian'] ?? false;
    _vegan = currentFilters['vegan'] ?? false;
    super.initState();
  }

  Widget buildSwitcher(
      String title, String subtitle, bool value, Function(bool) updateValue) {
    return SwitchListTile(
      value: value,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan
                };
                context
                    .read<MealsBloc>()
                    .add(FiltersUpdated(selectedFilters: selectedFilters));
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitcher(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitcher('Lactose-free', 'Only include lactose-free meals',
                  _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitcher(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              buildSwitcher('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
