import 'package:flutter/material.dart';
import 'package:meal_planner/widgets/recipe.dart';

class Meal extends StatelessWidget {
  const Meal({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const EmptyRecipe(),
        ],
      ),
    );
  }
}