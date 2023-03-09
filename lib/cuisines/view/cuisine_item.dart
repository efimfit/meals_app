import 'package:flutter/material.dart';

import 'package:meals_app/cuisines/view/cuisine_page.dart';

class CuisineItem extends StatelessWidget {
  const CuisineItem({
    super.key,
    required this.id,
    required this.title,
    required this.color,
  });

  final String id;
  final String title;
  final Color color;

  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(CuisinePage.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(7),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.6), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(7)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
