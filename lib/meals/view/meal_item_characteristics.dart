import 'package:flutter/material.dart';

class MealItemCharacteristics extends StatelessWidget {
  const MealItemCharacteristics({
    Key? key,
    required this.duration,
    required this.complexityText,
    required this.affordabilityText,
  }) : super(key: key);

  final int duration;
  final String complexityText;
  final String affordabilityText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(
              width: 6,
            ),
            Text('$duration min'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.work),
            const SizedBox(
              width: 6,
            ),
            Text(complexityText),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.attach_money),
            const SizedBox(
              width: 6,
            ),
            Text(affordabilityText),
          ],
        )
      ]),
    );
  }
}
